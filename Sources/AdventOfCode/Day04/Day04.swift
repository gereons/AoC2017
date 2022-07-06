//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/4
//

import AoCTools

final class Day04: Day, EmptyInput {
    let input: String
    let data: [[String]]
    init(input: String? = nil) {
        self.input = input ?? Self.input

        var data = [[String]]()
        let lines = self.input.components(separatedBy: "\n")
        for line in lines {
            let words = line.components(separatedBy: " ")
            data.append(words)
        }
        self.data = data
    }

    func run() {
        print("Solution for part 1: \(part1())")
        print("Solution for part 2: \(part2())")
    }

    func part1() -> Int {
        let timer = Timer(day); defer { timer.show() }

        var sum = 0
        for words in data {
            if words.count == Set(words).count {
                sum += 1
            }
        }
        return sum
    }

    func part2() -> Int {
        let timer = Timer(day); defer { timer.show() }

        var sum = 0
        for words in data {
            let sortedWords = words.map { $0.sorted(by: <) }
            if sortedWords.count == Set(sortedWords).count {
                sum += 1
            }
        }
        return sum
    }
}
