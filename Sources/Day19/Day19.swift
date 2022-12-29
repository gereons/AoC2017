//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/19
//

import AoCTools

extension Point.Direction {
    var opposite: Point.Direction {
        switch self {
        case .n: return .s
        case .s: return .n
        case .w: return .e
        case .e: return .w
        case .ne: return .sw
        case .nw: return .se
        case .se: return .nw
        case .sw: return .ne
        }
    }
}

private enum PathPoint {
    case straight(Character?)
    case corner

    var isStraight: Bool {
        switch self {
        case .straight: return true
        case .corner: return false
        }
    }

    init?(_ string: Character) {
        switch string {
        case "|", "-":
            self = .straight(nil)
        case "+":
            self = .corner
        case "A"..."Z":
            self = .straight(string)
        case " ":
            return nil
        default:
            fatalError("unexpected: \(string)")
        }
    }
}

struct Step {
    let point: Point
    let direction: Point.Direction
}

final class Day19: AOCDay {
    private var points = [Point: PathPoint]()

    init(rawInput: String? = nil) {
        let input = rawInput ?? Self.rawInput
        for (y, line) in input.components(separatedBy: "\n").enumerated() {
            for (x, ch) in line.enumerated() {
                points[Point(x,y)] = PathPoint(ch)
            }
        }
    }

    func part1() -> String {
        let step = findStart(in: points)

        // print("start at: \(step.point)")
        var result = ""
        var current = step
        while let next = nextPoint(from: current) {
            current = next
            // print(next)
            if case let .straight(letter) = points[current.point], let ch = letter {
                result.append(ch)
                // print(result)
            }
        }
        return result
    }

    private func nextPoint(from step: Step?) -> Step? {
        guard let step = step else { fatalError() }
        let current = points[step.point]!
        let next = step.point + step.direction.offset
        if current.isStraight {
            if points[next] != nil {
                return Step(point: next, direction: step.direction)
            }
            return nil
        } else {
            for dir in Point.Direction.orthogonal where dir != step.direction.opposite {
                let next = step.point + dir.offset
                if points[next] != nil {
                    return Step(point: next, direction: dir)
                }
            }
        }

        return nil
    }

    func part2() -> Int {
        let step = findStart(in: points)

        var count = 1
        var current = step
        while let next = nextPoint(from: current) {
            current = next
            count += 1
        }
        return count
    }

    private func findStart(in points: [Point: PathPoint]) -> Step {
        if let line = points.filter({ $0.key.y == 0 }).first(where: { $0.value.isStraight }) {
            return Step(point: line.key, direction: .s)
        }
        if let line = points.filter({ $0.key.x == 0 }).first(where: { $0.value.isStraight }) {
            return Step(point: line.key, direction: .w)
        }
        let maxY = points.keys.map { $0.y }.max(by: <)!
        if let line = points.filter({ $0.key.y == maxY }).first(where: { $0.value.isStraight }) {
            return Step(point: line.key, direction: .n)
        }
        let maxX = points.keys.map { $0.x }.max(by: <)!
        if let line = points.filter({ $0.key.x == maxX }).first(where: { $0.value.isStraight }) {
            return Step(point: line.key, direction: .e)
        }
        
        fatalError("no start point found")
    }
}
