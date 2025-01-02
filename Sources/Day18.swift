//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/18
//

import AoCTools

private enum Instruction {
    case snd(String)
    case set(String, String)
    case add(String, String)
    case mul(String, String)
    case mod(String, String)
    case rcv(String)
    case jgz(String, String)

    init(_ string: String) {
        let parts = string.components(separatedBy: " ")
        switch parts[0] {
        case "snd": self = .snd(parts[1])
        case "set": self = .set(parts[1], parts[2])
        case "add": self = .add(parts[1], parts[2])
        case "mul": self = .mul(parts[1], parts[2])
        case "mod": self = .mod(parts[1], parts[2])
        case "rcv": self = .rcv(parts[1])
        case "jgz": self = .jgz(parts[1], parts[2])
        default: fatalError()
        }
    }
}

private class CPUV1 {
    var registers = [String: Int]()
    var sound = 0
    var recovered = 0
    var pc = 0

    func execute(_ program: [Instruction]) -> Int {
        while 0..<program.count ~= pc {
            let instruction = program[pc]
            execute(instruction)
            if recovered != 0 {
                return recovered
            }
        }
        return 0
    }

    func execute(_ instruction: Instruction) {
        switch instruction {
        case .snd(let x):
            sound = valueOf(x)
        case .set(let x, let y):
            registers[x] = valueOf(y)
        case .add(let x, let y):
            registers[x, default: 0] += valueOf(y)
        case .mul(let x, let y):
            registers[x, default: 0] *= valueOf(y)
        case .mod(let x, let y):
            registers[x, default: 0] %= valueOf(y)
        case .rcv(let x):
            if valueOf(x) != 0 {
                recovered = sound
            }
        case .jgz(let x, let y):
            if valueOf(x) > 0 {
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
    let id: Int
    var program = [Instruction]()
    var registers = [String: Int]()
    var pc = 0
    var sendCount = 0

    var send: ((Int) -> Void)?
    var receive: (() -> Int)?
    var peek: (() -> Int?)?

    init(id: Int) {
        self.id = id
        registers["p"] = id
    }

    func executeNext() -> Bool {
        guard canExecuteNext() else { return false }
        execute(program[pc])
        return true
    }

    private func canExecuteNext() -> Bool {
        let instruction = program[pc]
        if case .rcv = instruction {
            return peek?() != nil
        }
        return true
    }

    private func execute(_ instruction: Instruction) {
        // print(id, instruction)
        switch instruction {
        case .snd(let x):
            send?(valueOf(x))
            sendCount += 1
        case .set(let x, let y):
            registers[x] = valueOf(y)
        case .add(let x, let y):
            registers[x, default: 0] += valueOf(y)
        case .mul(let x, let y):
            registers[x, default: 0] *= valueOf(y)
        case .mod(let x, let y):
            registers[x, default: 0] %= valueOf(y)
        case .rcv(let x):
            registers[x] = receive?()
        case .jgz(let x, let y):
            if valueOf(x) > 0 {
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

class Tablet {
    fileprivate var cpu0: CPUV2
    fileprivate var queue0 = [Int]()

    fileprivate var cpu1: CPUV2
    fileprivate var queue1 = [Int]()

    init() {
        cpu0 = CPUV2(id: 0)
        cpu1 = CPUV2(id: 1)

        cpu0.send = { self.queue1.append($0) }
        cpu0.receive = { self.queue0.removeFirst() }
        cpu0.peek = { self.queue0.first }

        cpu1.send = { self.queue0.append($0) }
        cpu1.receive = { self.queue1.removeFirst() }
        cpu1.peek = { self.queue1.first }
    }

    fileprivate func execute(_ program: [Instruction]) {
        cpu0.program = program
        cpu1.program = program
        while true {
            let wait0 = cpu0.executeNext()
            let wait1 = cpu1.executeNext()
            let deadlock = !wait0 && !wait1
            if deadlock {
                return
            }
        }
    }
}

final class Day18: AdventOfCodeDay {
    let title = "Duet"
    private let program: [Instruction]

    init(input: String) {
        program = input.components(separatedBy: "\n").map { Instruction($0) }
    }

    func part1() -> Int {
        let cpu = CPUV1()
        return cpu.execute(program)
    }

    func part2() -> Int {
        let tablet = Tablet()
        tablet.execute(program)
        return tablet.cpu1.sendCount
    }
}
