//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/22
//

import AoCTools

enum TurnDirection {
    case right // clockwise
    case left // counterclockwise
}

extension Direction {
    static let turns: [TurnDirection: [Direction: Direction]] = [
        .right: [
            .n: .e,
            .e: .s,
            .s: .w,
            .w: .n,
        ],
        .left: [
            .n: .w,
            .e: .n,
            .s: .e,
            .w: .s
        ]
    ]
    func turn(_ direction: TurnDirection) -> Direction {
        Self.turns[direction]![self]!
    }
}

enum NodeState {
    case clean
    case weakened
    case infected
    case flagged
}

final class Day22: AdventOfCodeDay {
    let title = "Sporifica Virus"
    let grid: [Point: NodeState]

    init(input: String) {
        var grid = [Point: NodeState]()
        for (y, line) in input.components(separatedBy: "\n").enumerated() {
            for (x, char) in line.enumerated() {
                grid[Point(x, y)] = char == "#" ? .infected : .clean
            }
        }
        self.grid = grid
    }

    func part1() -> Int {
        part1(loops: 10_000)
    }

    func part1(loops: Int) -> Int {
        let maxX = grid.keys.max { $0.x < $1.x }!.x
        let maxY = grid.keys.max { $0.y < $1.y }!.y
        
        var grid = grid
        let start = Point(maxX/2, maxY/2)
        var current = start
        var direction = Direction.n

        var infections = 0

        for _ in 0..<loops {
            let turn: TurnDirection
            if grid[current] == .infected {
                turn = .right
                grid[current] = .clean
            } else {
                turn = .left
                grid[current] = .infected


                infections += 1
            }

            direction = direction.turn(turn)
            current = current + direction.offset
        }

        return infections
    }

    func part2() -> Int {
        part2(loops: 10_000_000)
    }

    func part2(loops: Int) -> Int {
        let maxX = grid.keys.max { $0.x < $1.x }!.x
        let maxY = grid.keys.max { $0.y < $1.y }!.y

        var grid = grid
        let start = Point(maxX/2, maxY/2)
        var current = start
        var direction = Direction.n

        var infections = 0

        for _ in 0..<loops {
            switch grid[current] {
            case .clean, .none:
                direction = direction.turn(.left)
                grid[current] = .weakened
            case .weakened:
                grid[current] = .infected
                infections += 1
            case .infected:
                direction = direction.turn(.right)
                grid[current] = .flagged
            case .flagged:
                direction = direction.opposite
                grid[current] = .clean
            }

            current = current + direction.offset
        }

        return infections
    }
}
