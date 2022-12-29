//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/15
//

import AoCTools
import CoreGraphics

class Generator {
    private var previous: Int
    private var factor: Int
    private var multiple: Int

    init(start: Int, factor: Int, multiple: Int) {
        self.previous = start
        self.factor = factor
        self.multiple = multiple
    }

    func next() -> Int {
        let new = (previous * factor) % 2147483647
        previous = new
        return new
    }

    func nextPicky() -> Int {
        while true {
            let new = next()
            if new.isMultiple(of: multiple) {
                return new
            }
        }
    }
}

final class Day15: AOCDay {
    let startA: Int
    let startB: Int

    init(rawInput: String? = nil) {
        startA = 277
        startB = 349
    }

    init(startA: Int, startB: Int) {
        self.startA = startA
        self.startB = startB
    }

    func part1() -> Int {
        let genA = Generator(start: startA, factor: 16807, multiple: 4)
        let genB = Generator(start: startB, factor: 48271, multiple: 8)
        var matches = 0
        for _ in 0..<40_000_000 {
            let a = genA.next()
            let b = genB.next()
            if (a & 0xFFFF) == (b & 0xFFFF) {
                matches += 1
            }
        }

        return matches
    }

    func part2() -> Int {
        let genA = Generator(start: startA, factor: 16807, multiple: 4)
        let genB = Generator(start: startB, factor: 48271, multiple: 8)

        var matches = 0
        for _ in 0..<5_000_000 {
            let a = genA.nextPicky()
            let b = genB.nextPicky()
            if (a & 0xFFFF) == (b & 0xFFFF) {
                matches += 1
            }
        }

        return matches
    }
}
