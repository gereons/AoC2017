//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/10
//

import AoCTools

struct CircularBuffer {
    let size: Int
    var storage: [Int]

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
    let input: [Int]
    var buffer: CircularBuffer

    convenience init(rawInput: String? = nil) {
        self.init(rawInput: rawInput, list: nil)
    }

    init(rawInput: String? = nil, list: [Int]?) {
        let input = rawInput ?? Self.rawInput
        self.input = input.components(separatedBy: ",").compactMap { Int($0) }

        if let list = list {
            buffer = CircularBuffer(with: list)
        } else {
            buffer = CircularBuffer(with: [Int](0..<256))
        }
    }

    func part1() -> Int {
        var skip = 0
        var position = 0

        for length in input {
            let seq = buffer.section(from: position, length: length).reversed()
            buffer.store(Array(seq), at: position)

            position += length + skip
            skip += 1
        }

        let head = buffer.section(from: 0, length: 2)
        return head.reduce(1, *)
    }

    func part2() -> String {
        return ""
    }
}
