//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/25
//

import AoCTools

final class Day25: Day, EmptyInput {
    let input: String
    init(input: String? = nil) {
        self.input = input ?? Self.input
    }

    func run() {
        Timer.time(day) {
            // parse data here
        }

        print("Solution for part 1: \(part1())")
        print("Solution for part 2: \(part2())")
    }

    func part1() -> Int {
        let timer = Timer(day); defer { timer.show() }
        return 0
    }

    func part2() -> Int {
        let timer = Timer(day); defer { timer.show() }
        return 0
    }
}
