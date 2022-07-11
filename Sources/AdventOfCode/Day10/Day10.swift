//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/10
//

import AoCTools

struct CircularBuffer {
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
        assert(result.count == length)
        return result
    }

    mutating func store(_ data: [Int], at start: Int) {
        for (index, value) in data.enumerated() {
            storage[realIndex(start + index)] = value
        }
    }
}

final class Day10: AOCDay {
    let rawInput: String
    let input: [Int]
    var buffer: CircularBuffer

    convenience init(rawInput: String? = nil) {
        self.init(rawInput: rawInput, list: nil)
    }

    init(rawInput: String? = nil, list: [Int]?) {
        let input = rawInput ?? Self.rawInput
        self.rawInput = input
        self.input = input.components(separatedBy: ",").compactMap { Int($0) }

        if let list = list {
            buffer = CircularBuffer(with: list)
        } else {
            buffer = CircularBuffer(with: [Int](0..<256))
        }
    }

    func part1() -> Int {
        var buffer = buffer
        knotHash(rounds: 1, in: &buffer, lengths: input)
        return buffer.storage[0] * buffer.storage[1]
    }

    func part2() -> String {
        var ascii = rawInput.compactMap { Int($0.asciiValue ?? 0) }
        ascii.append(contentsOf: [17, 31, 73, 47, 23])

        knotHash(rounds: 64, in: &buffer, lengths: ascii)

        var hash = [UInt8](repeating: 0, count: 16)
        for (index, value) in buffer.storage.enumerated() {
            hash[index / 16] ^= UInt8(value)
        }
        return hash.map { String(format: "%02hhx", $0) }.joined()
    }

    private func knotHash(rounds: Int,
                          in buffer: inout CircularBuffer,
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
