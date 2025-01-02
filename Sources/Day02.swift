//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/3
//

import AoCTools

final class Day02: AdventOfCodeDay {
    let title = "Corruption Checksum"

    let data: [[Int]]

    init(input: String) {
        var data = [[Int]]()
        let lines = input.components(separatedBy: "\n")
        for line in lines {
            let numbers = line.components(separatedBy: .whitespaces)
            let ints = numbers.compactMap { Int($0) }
            data.append(ints)
        }
        self.data = data
    }

    func part1() -> Int {
        var sum = 0
        for line in data {
            let min = line.min(by: <)!
            let max = line.max(by: <)!
            let diff = max - min
            sum += diff
        }
        return sum
    }

    func part2() -> Int {
        var sum = 0
        for line in data {
            let (dividend, divisor) = findDividingPair(in: line)
            // print(line, dividend, divisor, dividend / divisor)
            sum += dividend / divisor
        }
        return sum
    }

    private func findDividingPair(in data: [Int]) -> (Int, Int) {
        for i in 0..<data.count-1 {
            for j in 1..<data.count {
                if i == j { continue }
                let divisor = min(data[i], data[j])
                let dividend = max(data[i], data[j])
                let result = Double(dividend) / Double(divisor)
                if Double(Int(result)) == result {
                    return (dividend, divisor)
                }
            }
        }
        fatalError()
    }
}
