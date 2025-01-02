//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/16
//

import AoCTools

enum DanceMove {
    case spin(Int) // spin, sX
    case exchange(Int, Int) // exchange, xA,B
    case partner(Character, Character) // partner, pA/B

    init(_ string: String) {
        let ch = string.prefix(1)
        switch ch {
        case "s": self = .spin(Int(string.dropFirst())!)
        case "x":
            let parts = string.dropFirst(1).components(separatedBy: "/")
            self = .exchange(Int(parts[0])!, Int(parts[1])!)
        case "p":
            let parts = string.dropFirst(1).components(separatedBy: "/")
            self = .partner(Character(parts[0]), Character(parts[1]))
        default:
            fatalError(string)
        }
    }
}

final class Day16: AdventOfCodeDay {
    let title = "Permutation Promenade"
    let programs: [Character]
    let dance: [DanceMove]

    convenience init(input: String) {
        self.init(input: input, programs: nil)
    }

    init(input: String, programs: String? = nil) {
        self.programs = (programs ?? "abcdefghijklmnop").map { $0 }
        self.dance = input.components(separatedBy: ",").map { DanceMove($0) }
    }

    func part1() -> String {
        var line = programs
        for move in dance {
            apply(move, to: &line)
        }
        return line.map { String($0) }.joined()
    }

    private func apply(_ move: DanceMove, to line: inout [Character]) {
        switch move {
        case .spin(let length):
            line.insert(contentsOf: line.suffix(length), at: 0)
            line.removeLast(length)
        case .exchange(let pos1, let pos2):
            line.swapAt(pos1, pos2)
        case .partner(let ch1, let ch2):
            let pos1 = line.firstIndex(of: ch1)
            let pos2 = line.firstIndex(of: ch2)
            line.swapAt(pos1!, pos2!)
        }
    }

    func part2() -> String {
        var line = programs
        for move in dance {
            apply(move, to: &line)
        }

        let frequency = findLoopLength(line)
        let remainder = 999999999 % frequency

        for _ in 0..<remainder {
            for move in dance {
                apply(move, to: &line)
            }
        }
        return line.map { String($0) }.joined()
    }

    private func findLoopLength(_ line: [Character]) -> Int {
        var line = line
        var seen = Set<String>()
        for i in 0...100 {
            for move in dance {
                apply(move, to: &line)
            }
            let l = line.map { String($0) }.joined()
            if seen.contains(l) {
                return i
            }
            seen.insert(l)
        }
        fatalError("no loop")
    }
}
