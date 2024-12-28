//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/11
//

import AoCTools

final class Day11: AOCDay {
    let directions: [Hex.FlatDirection]

    init(input: String) {
        directions = input.components(separatedBy: ",").compactMap { Hex.FlatDirection(rawValue: $0) }
    }

    func part1() -> Int {
        var point = Hex.Point.zero

        directions.forEach {
            point = point.moved(to: $0)
        }

        return point.distance(to: .zero)
    }

    func part2() -> Int {
        var point = Hex.Point.zero
        var maxDistance = 0
        directions.forEach {
            point = point.moved(to: $0)
            maxDistance = max(maxDistance, point.distance(to: .zero))
        }

        return maxDistance
    }
}
