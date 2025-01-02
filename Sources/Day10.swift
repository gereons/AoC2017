//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/10
//

import AoCTools

final class Day10: AdventOfCodeDay {
    let title = "Knot Hash"
    let rawInput: String
    let ints: [Int]
    let knotHash: KnotHash

    convenience init(input: String) {
        self.init(input: input, list: nil)
    }

    init(input: String, list: [Int]?) {
        ints = input.components(separatedBy: ",").compactMap { Int($0) }
        rawInput = input

        knotHash = KnotHash(list: list)
    }

    func part1() -> Int {
        knotHash.performRound(for: ints)
        return knotHash.buffer.storage[0] * knotHash.buffer.storage[1]
    }

    func part2() -> String {
        KnotHash().hash(for: rawInput)
    }
}
