//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/3
//

import AoCTools

private enum SpiralDirection {
    case up, left, right, down, nextRing
}

private extension Point {
    func next(in direction: SpiralDirection) -> Point {
        var (x, y) = (self.x, self.y)
        switch direction {
        case .up: y -= 1
        case .down: y += 1
        case .left: x -= 1
        case .right, .nextRing: x += 1
        }
        return Point(x, y)
    }
}

private final class Spiral {
    private var currentDirection = SpiralDirection.nextRing
    private var sideLength = 1
    private var stepsTaken = 0

    private var nextPoint = Point(0, 0)

    func next() -> Point {
        let current = nextPoint
        nextPoint = current.next(in: currentDirection)
        stepsTaken += 1

        if stepsTaken == steps(in: currentDirection) {
            switch currentDirection {
            case .up: currentDirection = .left
            case .left: currentDirection = .down
            case .down: currentDirection = .right
            case .right: currentDirection = .nextRing
            case .nextRing:
                currentDirection = .up
                sideLength += 2
            }
            stepsTaken = 0
        }
        return current
    }

    func steps(in direction: SpiralDirection) -> Int {
        switch direction {
        case .up: return sideLength - 2
        case .left, .down, .right: return sideLength - 1
        case .nextRing: return 1
        }
    }

    static func point(for number: Int) -> Point {
        let spiral = Spiral()
        var index = 1
        while true {
            let point = spiral.next()
            if index == number {
                return point
            }
            index += 1
        }
    }
}

final class Day03: AdventOfCodeDay {
    let title = "Spiral Memory"
    let input: Int

    init(input: String) {
        self.input = Int(input) ?? 0
    }

    func part1() -> Int {
        let point = Spiral.point(for: input)
        return point.distance(to: Point(0, 0))
    }

    func part2() -> Int {
        var memory = [Point(0, 0): 1]

        var index = 2
        while true {
            let point = Spiral.point(for: index)
            let sum = sumAllNeighbors(of: point, in: memory)
            if sum > input {
                return sum
            }
            memory[point] = sum
            index += 1
        }
    }

    private func sumAllNeighbors(of point: Point, in memory: [Point: Int]) -> Int {
        var sum = 0
        for n in point.neighbors(adjacency: .all) {
            sum += memory[n] ?? 0
        }
        return sum
    }
}
