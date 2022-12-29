//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/4
//

import AoCTools

final class Day04: AOCDay {
    let input: String
    let data: [[String]]
    init(rawInput: String? = nil) {
        self.input = rawInput ?? Self.rawInput

        var data = [[String]]()
        let lines = self.input.components(separatedBy: "\n")
        for line in lines {
            let words = line.components(separatedBy: " ")
            data.append(words)
        }
        self.data = data
    }

    func part1() -> Int {
        var sum = 0
        for words in data {
            if words.count == Set(words).count {
                sum += 1
            }
        }
        return sum
    }

    func part2() -> Int {
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
