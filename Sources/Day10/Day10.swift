//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/10
//

import AoCTools


final class Day10: AOCDay {
    let rawInput: String
    let input: [Int]
    let knotHash: KnotHash

    convenience init(rawInput: String? = nil) {
        self.init(rawInput: rawInput, list: nil)
    }

    init(rawInput: String? = nil, list: [Int]?) {
        let input = rawInput ?? Self.rawInput
        self.rawInput = input
        self.input = input.components(separatedBy: ",").compactMap { Int($0) }

        if let list = list {
            knotHash = KnotHash(list: list)
        } else {
            knotHash = KnotHash()
        }
    }

    func part1() -> Int {
        knotHash.performRound(for: input)
        return knotHash.buffer.storage[0] * knotHash.buffer.storage[1]
    }

    func part2() -> String {
        KnotHash().hash(for: rawInput)
    }
}
