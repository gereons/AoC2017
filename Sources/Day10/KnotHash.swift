//
//  KnotHash.swift
//  
//
//  Created by Gereon Steffens on 21.07.22.
//

import Foundation

class KnotHash {
    struct FixedSizeCircularBuffer {
        let size: Int
        private(set) var storage: [Int]

        init(with data: [Int]) {
            self.size = data.count
            storage = data
        }

        private func realIndex(_ index: Int) -> Int {
            index % size
        }

        func section(from start: Int, length: Int) -> [Int] {
            var result = [Int]()
            for idx in start..<start+length {
                result.append(storage[realIndex(idx)])
            }
            return result
        }

        mutating func store(_ data: [Int], at start: Int) {
            for (index, value) in data.enumerated() {
                storage[realIndex(start + index)] = value
            }
        }
    }

    private(set) var buffer: FixedSizeCircularBuffer

    init(list: [Int]? = nil) {
        self.buffer = FixedSizeCircularBuffer(with: list ?? [Int](0..<256))
    }

    func rawHash(for string: String) -> [UInt8] {
        var ascii = string.compactMap { Int($0.asciiValue ?? 0) }
        ascii.append(contentsOf: [17, 31, 73, 47, 23])

        knot(rounds: 64, in: &buffer, lengths: ascii)
        var hash = [UInt8](repeating: 0, count: 16)
        for (index, value) in buffer.storage.enumerated() {
            hash[index / 16] ^= UInt8(value)
        }
        return hash
    }

    func hash(for string: String) -> String {
        return rawHash(for: string).map { String(format: "%02hhx", $0) }.joined()
    }

    func performRound(for lengths: [Int]) {
        var skip = 0
        var position = 0

        for length in lengths {
            let seq = buffer.section(from: position, length: length).reversed()
            buffer.store(Array(seq), at: position)

            position += length + skip
            skip += 1
        }
    }

    private func knot(rounds: Int,
                      in buffer: inout FixedSizeCircularBuffer,
                      lengths: [Int]) {
        var skip = 0
        var position = 0

        for _ in 0..<rounds {
            for length in lengths {
                let seq = buffer.section(from: position, length: length).reversed()
                buffer.store(Array(seq), at: position)

                position += length + skip
                skip += 1
            }
        }
    }
}
