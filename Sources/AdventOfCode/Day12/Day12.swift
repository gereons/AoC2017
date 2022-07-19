//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/12
//

import AoCTools

private struct Program {
    let id: Int
    let connectedTo: Set<Int>

    init(_ string: String) {
        let parts = string.components(separatedBy: " <-> ")

        self.id = Int(parts[0])!
        self.connectedTo = Set(parts[1].components(separatedBy: ", ").map { Int($0)! })
    }
}

final class Day12: AOCDay {
    private let programs: [Int: Program]
    init(rawInput: String? = nil) {
        let input = rawInput ?? Self.rawInput

        let programs = input.components(separatedBy: "\n").map { Program($0) }
        self.programs = Dictionary(uniqueKeysWithValues: zip(programs.map { $0.id }, programs))
    }

    func part1() -> Int {
        let start = programs[0]!
        var seen = Set<Int>()
        findConnected(to: start, programs, &seen)
        return seen.count
    }

    func part2() -> Int {
        var programs = self.programs
        var start = programs[0]
        var seen = Set<Int>()

        var groups = 0
        while start != nil {
            findConnected(to: start!, programs, &seen)
            seen.forEach { programs[$0] = nil }
            groups += 1
            seen.removeAll()
            start = programs.first?.value
        }
        return groups
    }

    private func findConnected(to program: Program, _ programs: [Int: Program], _ seen: inout Set<Int>) {
        if seen.contains(program.id) {
            return
        }

        seen.insert(program.id)
        for connected in program.connectedTo {
            findConnected(to: programs[connected]!, programs, &seen)
        }
    }
}
