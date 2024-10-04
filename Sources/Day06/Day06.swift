//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/6
//

import AoCTools

final class Day06: AOCDay {
    let ints: [Int]

    init(input: String) {
        ints = input.components(separatedBy: .whitespaces).compactMap { Int($0) }
    }

    private var solution: (steps: Int, firstSeen: Int)?

    func part1() -> Int {
        if solution == nil {
            solution = redistribute()
        }
        return solution!.steps
    }

    func part2() -> Int {
        if solution == nil {
            solution = redistribute()
        }
        return solution!.steps - solution!.firstSeen
    }

    private func redistribute() -> (Int, Int) {
        var seen = [[Int]: Int]()
        var blocks = ints
        seen[blocks] = 0
        var steps = 0

        while true {
            var index = startIndex(for: blocks)

            var distribute = blocks[index]
            blocks[index] = 0
            while distribute > 0 {
                index += 1
                if index >= blocks.count { index = 0 }
                blocks[index] += 1
                distribute -= 1
            }

            steps += 1
            if let seenAt = seen[blocks] {
                return (steps, seenAt)
            } else {
                seen[blocks] = steps
            }
        }
    }

    private func startIndex(for blocks: [Int]) -> Int {
        let max = blocks.enumerated().max { e1, e2 in
            e1.element < e2.element
        }
        return max!.offset
    }
}
