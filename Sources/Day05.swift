//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/5
//

import AoCTools

final class Day05: AdventOfCodeDay {
    let title = "A Maze of Twisty Trampolines, All Alike"
    let data: [Int]

    init(input: String) {
        let lines = input.components(separatedBy: "\n")
        data = lines.compactMap { Int($0) }
    }

    func part1() -> Int {
        var memory = data
        var pc = 0
        var steps = 0
        while 0..<memory.count ~= pc {
            let move = memory[pc]
            memory[pc] += 1
            pc += move
            steps += 1
        }
        return steps
    }

    func part2() -> Int {
        var memory = data
        var pc = 0
        var steps = 0
        while 0..<memory.count ~= pc {
            let move = memory[pc]
            memory[pc] += move >= 3 ? -1 : 1
            pc += move
            steps += 1
        }
        return steps
    }
}
