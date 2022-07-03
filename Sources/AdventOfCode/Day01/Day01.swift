//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/1
//

import AoCTools

final class Day01: Day, EmptyInput {
    let input: String
    let digits: [Int]

    init(input: String? = nil) {
        self.input = input ?? Self.input
        self.digits = self.input.compactMap { Int(String($0)) }
    }

    func run() {
        print("Solution for part 1: \(part1())")
        print("Solution for part 2: \(part2())")
    }

    func part1() -> Int {
        let timer = Timer(day); defer { timer.show() }

        var prev: Int?
        var sum = 0
        for digit in digits {
            if digit == prev {
                sum += digit
            }
            prev = digit
        }
        if digits.last == digits.first {
            sum += digits.first!
        }

        return sum
    }

    func part2() -> Int {
        let timer = Timer(day); defer { timer.show() }

        var sum = 0
        for (index, digit) in digits.enumerated() {
            var idx = (digits.count / 2) + index
            if idx >= digits.count { idx -= digits.count }
            if digit == digits[idx] {
                sum += digit
            }
        }

        return sum
    }
}
