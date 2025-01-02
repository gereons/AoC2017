//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/8
//

import AoCTools
import Foundation
/*
 b inc 5 if a > 1
 a inc 1 if b < 5
 c dec -10 if a >= 1
 c inc -20 if c == 10
 <=
 !=
 */

private struct Instruction {
    let register: String
    let change: String
    let value: Int
    let condition: Condition

    struct Condition {
        let register: String
        let compare: String
        let value: Int
    }

    static let regex = try! NSRegularExpression(pattern: #"(.*) (.*) (-?\d*) if (.*) (.*) (-?\d*)"#)

    init(_ string: String) {
        let range = NSRange(location: 0, length: string.count)
        let matches = Self.regex.matches(in: string, options: [], range: range)

        let match = matches.last!
        self.register = String(string[Range(match.range(at: 1), in: string)!])
        self.change = String(string[Range(match.range(at: 2), in: string)!])
        self.value = Int(string[Range(match.range(at: 3), in: string)!])!
        self.condition = Condition(
            register: String(string[Range(match.range(at: 4), in: string)!]),
            compare: String(string[Range(match.range(at: 5), in: string)!]),
            value: Int(string[Range(match.range(at: 6), in: string)!])!
            )
    }
}

final class Day08: AdventOfCodeDay {
    let title = "I Heard You Like Registers"
    private let instructions: [Instruction]

    init(input: String) {
        instructions = input.components(separatedBy: "\n").map { Instruction($0) }
        // print(instructions)
    }

    func part1() -> Int {
        var registers = [String: Int]()

        instructions.forEach {
            _ = execute($0, with: &registers)
        }

        return registers.values.max(by: <)!
    }

    func part2() -> Int {
        var registers = [String: Int]()

        var max = 0
        instructions.forEach {
            if let r = execute($0, with: &registers) {
                max = Swift.max(max, r)
            }
        }

        return max
    }

    private func execute(_ ins: Instruction, with registers: inout [String: Int]) -> Int? {
        if evaluate(ins.condition, with: registers) {
            var r = registers[ins.register, default: 0]
            switch ins.change {
            case "inc": r += ins.value
            case "dec": r -= ins.value
            default: fatalError()
            }
            registers[ins.register] = r
            return r
        }
        return nil
    }

    private func evaluate(_ cond: Instruction.Condition, with registers: [String: Int]) -> Bool {
        let r = registers[cond.register] ?? 0
        switch cond.compare {
        case ">": return r > cond.value
        case ">=": return r >= cond.value
        case "<": return r < cond.value
        case "<=": return r <= cond.value
        case "==": return r == cond.value
        case "!=": return r != cond.value
        default: fatalError()
        }
    }
}
