//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/9
//

import AoCTools

final class Day09: AOCDay {
    let input: String
    private var result: (Int, Int)?
    init(rawInput: String? = nil) {
        self.input = rawInput ?? Self.rawInput
    }

    typealias Node = TreeNode<Void>

    func part1() -> Int {
        result = scoreGarbage()
        return result!.0
    }

    func part2() -> Int {
        if result == nil { result = scoreGarbage() }
        return result!.1
    }

    private func scoreGarbage() -> (Int, Int) {
        var groupScore = 0
        var garbageCount = 0
        var inGroup = 0
        var inGarbage = false
        var isEscaped = false
        for ch in input {
            if isEscaped {
                isEscaped = false
                continue
            }
            if inGarbage {
                if ch == "!" { isEscaped = true; continue }
                if ch != ">" { garbageCount += 1; continue }
            }
            switch ch {
            case "{":
                inGroup += 1
            case "}":
                groupScore += inGroup
                inGroup -= 1
            case "<":
                inGarbage = true
            case ">":
                inGarbage = false
            case "!":
                isEscaped = true
            default:
                continue
            }
        }
        return (groupScore, garbageCount)
    }
}
