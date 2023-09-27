//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/14
//

import AoCTools

final class Day14: AOCDay {
    let input: String
    init(input: String? = nil) {
        self.input = input ?? Self.input
    }

    func part1() -> Int {
        var sum = 0
        for i in 0...127 {
            let hash = KnotHash().rawHash(for: "\(input)-\(i)")
            sum += bitCount(hash)
        }
        return sum
    }

    private func bitCount(_ bytes: [UInt8]) -> Int {
        bytes.reduce(0) { $0 + bitCount($1) }
    }

    private func bitCount(_ byte: UInt8) -> Int {
        var c = 0
        var byte = byte
        while byte != 0 {
            byte &= byte - 1
            c += 1
        }
        return c
    }

    func part2() -> Int {
        var grid = [Point: Bool]()

        for y in 0...127 {
            let hash = KnotHash().rawHash(for: "\(input)-\(y)")
            makePoints(from: hash, in: &grid, at: y)
        }

        // grid.draw(xRange: 0...127, yRange: 0...127)
        var regions = 0

        while let start = grid.keys.first {
            let region = findRegion(in: grid, startAt: start)
            assert(!region.isEmpty)
            region.forEach { grid[$0] = nil }
            regions += 1
        }

        return regions
    }

    private func findRegion(in grid: [Point: Bool], startAt start: Point) -> Set<Point> {
        var seen = Set<Point>()
        findRegion(in: grid, startAt: start, seen: &seen)
        return seen
    }

    private func findRegion(in grid: [Point: Bool], startAt start: Point, seen: inout Set<Point>) {
        if seen.contains(start) { return }
        seen.insert(start)

        for n in start.neighbors(adjacency: .orthogonal) {
            if grid[n] == true {
                findRegion(in: grid, startAt: n, seen: &seen)
            }
        }
    }

    private func makePoints(from bytes: [UInt8], in grid: inout [Point: Bool], at y: Int) {
        var x = 0
        for byte in bytes {
            for bit in (UInt8(0)...7).reversed() {
                if byte & (1 << bit) != 0 {
                    grid[Point(x, y)] = true
                }
                x += 1
            }
        }
    }
}
