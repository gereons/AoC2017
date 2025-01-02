//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/21
//

import AoCTools
import Algorithms
import Foundation

private struct Grid: Hashable {
    let grid: [[Character]]

    static let zero = Grid(grid: [])

    init(grid: [[Character]]) {
        self.grid = grid
    }

    init(string: String) {
        grid = string
            .split(separator: "/")
            .map { line in
                line.map { $0 }
            }
    }

    var rotated: Grid {
        let rotated =
            (0..<grid.count).map { r in
                (0..<grid.count).map { c in
                    grid[c][grid.count - 1 - r]
                }
            }
        return Grid(grid: rotated)
    }

    var flipped: Grid {
        Grid(grid: grid.map { $0.reversed() })
    }

    var combinations: [Grid] {
        let rotations = (0..<3)
            .reduce(into: [self]) { rots, _ in
                rots.append(rots.last!.rotated)
            }
        let flips = rotations.map { $0.flipped }

        return rotations + flips
    }

    func rows(ofSize size: Int) -> [Grid] {
        grid
            .chunks(ofCount: size)
            .map { Grid(grid: Array($0)) }
    }

    func columns(ofSize size: Int) -> [Grid] {
        let chunked = grid.map { row in
            row.chunks(ofCount: size).map { Array($0) }
        }

        return (0..<chunked[0].count).map { x in
            (0..<chunked.count).map { y in
                chunked[y][x]
            }
        }
        .map { Grid(grid: Array($0)) }
    }

    func split(size: Int) -> [Grid] {
        let splits = grid.count / size
        if splits == 1 {
            return [self]
        } else {
            return rows(ofSize: size)
                .map { row in
                    row.columns(ofSize: size)
                }
                .flatMap { $0 }
        }
    }

    func add(_ other: Grid) -> Grid {
        if self.grid.count == 0 { return other }

        let new = grid.enumerated().map { index, row in
            row + other.grid[index]
        }

        return Grid(grid: new)
    }

    func stack(_ other: Grid) -> Grid {
        Grid(grid: grid + other.grid)
    }
}

fileprivate extension Array where Element == Grid {
    func join() -> Grid {
        let rows = Int(sqrt(Double(count)))

        let chunks = chunks(ofCount: rows)
        return chunks
            .map { row in
                row.reduce(.zero) { $0.add($1) }
            }
            .reduce(.zero) { $0.stack($1) }
    }
}

final class Day21: AdventOfCodeDay {
    let title = "Fractal Art"
    private let transformations: [Grid: Grid]

    init(input: String) {
        var xforms = [Grid: Grid]()
        for line in input.components(separatedBy: "\n") {
            let parts = line.components(separatedBy: " => ")
            let from = Grid(string: parts[0])
            let to = Grid(string: parts[1])

            from.combinations.forEach {
                xforms[$0] = to
            }
        }
        transformations = xforms
    }

    func part1() -> Int {
        part1(iterations: 5)
    }

    func part1(iterations: Int) -> Int {
        var grid = Grid(string: ".#./..#/###")

        for _ in 0..<iterations {
            let splitSize = grid.grid.count.isMultiple(of: 2) ? 2 : 3
            let splits = grid.split(size: splitSize)
            let transformed = splits.map { transformations[$0]! }
            grid = transformed.join()
        }

        return grid.grid.flatMap { $0 }.filter { $0 == "#" }.count
    }

    func part2() -> Int {
        return part1(iterations: 18)
    }
}
