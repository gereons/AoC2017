//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/14
//

import AoCTools

final class Day14: AOCDay {
    let input: String
    init(rawInput: String? = nil) {
        self.input = rawInput ?? Self.rawInput
    }

    func part1() -> Int {
        var sum = 0
        for i in 0...127 {
            let hash = KnotHash().rawHash(for: "\(input)-\(i)")
            sum += bitCount(hash)
        }
        return sum
    }

    private func bitCount(_ bytes: [UInt8]) -> Int {
        bytes.reduce(0) { $0 + bitCount($1) }
    }

    private func bitCount(_ byte: UInt8) -> Int {
        var c = 0
        var byte = byte
        while byte != 0 {
            byte &= byte - 1
            c += 1
        }
        return c
    }

    func part2() -> Int {
        return 0
    }
}
