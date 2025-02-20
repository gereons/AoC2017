//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/17
//

import AoCTools

private class FakeCircularBuffer {
    private(set) var positionOf0: Int
    private(set) var valueAfter0: Int
    private(set) var current: Int
    private(set) var size: Int

    init() {
        current = 0
        positionOf0 = 0
        valueAfter0 = 0
        size = 1
    }

    private func realIndex(_ index: Int) -> Int {
        index % size
    }

    func setNext(value: Int, after steps: Int) {
        let position = realIndex(current + steps) + 1
        size += 1
        current = position

        if position == positionOf0 + 1 {
            valueAfter0 = value
            // print(valueAfter0)
        }
        if position < positionOf0 {
            positionOf0 += 1
        }
    }
}

final class Day17: AdventOfCodeDay {
    let title = "Spinlock"
    let steps: Int

    init(input: String) {
        self.steps = Int(input)!
    }

    func part1() -> Int {
        let cb = CircularBuffer<Int>()
        cb.insert(value: 0)
        for i in 1 ... 2017 {
            cb.moveCurrent(by: steps)
            cb.insert(value: i)
        }
        cb.moveCurrent(by: 1)
        return cb.value()
    }

    func part2() -> Int {
        let cb = FakeCircularBuffer()
        for i in 1 ... 50_000_000 {
            cb.setNext(value: i, after: steps)
        }
        return cb.valueAfter0
    }
}
