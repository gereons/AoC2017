//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/23
//

import AoCTools
import Foundation

private enum Instruction {
    case set(String, String)
    case sub(String, String)
    case mul(String, String)
    case jnz(String, String)

    init(_ string: String) {
        let parts = string.components(separatedBy: " ")
        switch parts[0] {
        case "set": self = .set(parts[1], parts[2])
        case "sub": self = .sub(parts[1], parts[2])
        case "mul": self = .mul(parts[1], parts[2])
        case "jnz": self = .jnz(parts[1], parts[2])
        default: fatalError()
        }
    }
}

private class CPU {
    var registers = [String: Int]()
    private(set) var mulCount = 0
    var pc = 0

    @discardableResult
    func execute(_ program: [Instruction]) -> Int {
        while 0..<program.count ~= pc {
            let instruction = program[pc]
            execute(instruction)
        }
        return mulCount
    }

    func execute(_ instruction: Instruction) {
        switch instruction {
        case .set(let x, let y):
            registers[x] = valueOf(y)
        case .sub(let x, let y):
            registers[x, default: 0] -= valueOf(y)
        case .mul(let x, let y):
            registers[x, default: 0] *= valueOf(y)
            mulCount += 1
        case .jnz(let x, let y):
            if valueOf(x) != 0 {
                pc += valueOf(y)
                return
            }
        }
        pc += 1
    }

    private func valueOf(_ str: String) -> Int {
        if let i = Int(str) {
            return i
        }
        return registers[str, default: 0]
    }
}

private class CPUV2 {
    var nonPrimes=0

    var inc = false
    var debug = true

    @discardableResult
    func execute() -> Int {
        let start: Int
        let end: Int
        if !debug {
            start = 81 * 100 + 100000
            end = start + 17000
        } else {
            start = 81
            end = 81
        }

        for v in stride(from: start, to: end + 1, by: 17) {
            if !isPrime(v) {
                nonPrimes += 1
            }
        }
        return nonPrimes
    }

    private func isPrime(_ v: Int) -> Bool {
        let sqrt = Int(sqrt(Double(v)))
        for d in 2...sqrt {
            if v.isMultiple(of: d) {
                return false
            }
        }
        return true
    }
}

final class Day23: AdventOfCodeDay {
    let title = "Coprocessor Conflagration"
    private let program: [Instruction]

    init(input: String) {
        program = input.components(separatedBy: "\n").map { Instruction($0) }
    }

    func part1() -> Int {
        let cpu = CPU()
        return cpu.execute(program)
    }

    func part2() -> Int {
        let cpu = CPUV2()
        cpu.debug = false
        cpu.execute()
        return cpu.nonPrimes
    }

}
