//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/24
//

import AoCTools

struct Component: Hashable, CustomStringConvertible {
    let ports: (Int, Int)

    var strength: Int {
        ports.0 + ports.1
    }

    func matches(_ pins: Int) -> Bool {
        ports.0 == pins || ports.1 == pins
    }

    init(_ p1: Int, _ p2: Int) {
        self.ports = (p1, p2)
    }

    init(_ string: String) {
        let parts = string.components(separatedBy: "/")
        self.init(Int(parts[0])!, Int(parts[1])!)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ports.0)
        hasher.combine(ports.1)
    }

    static func==(lhs: Component, rhs: Component) -> Bool {
        lhs.ports.0 == rhs.ports.0 && lhs.ports.1 == rhs.ports.1
    }

    var description: String {
        "\(ports.0)/\(ports.1)"
    }
}

class Bridge {
    private(set) var components = [Component]()
    private var uses = Set<Component>()
    private(set) var pins = 0

    var strength: Int {
        components.reduce(0) { $0 + $1.strength }
    }

    func add(_ c: Component) {
        if c.ports.0 == pins {
            pins = c.ports.1
        } else {
            assert(pins == c.ports.1)
            pins = c.ports.0
        }
        assert(!uses(c))
        components.append(c)
        uses.insert(c)
    }

    func uses(_ c: Component) -> Bool {
        guard !uses.isEmpty else { return false }
        return uses.contains(c)
    }

    func copy() -> Bridge {
        let new = Bridge()
        new.components = self.components
        new.uses = self.uses
        new.pins = self.pins
        return new
    }
}


final class Day24: AdventOfCodeDay {
    let title = "Electromagnetic Moat"
    let components: [Component]

    init(input: String) {
        components = input.components(separatedBy: "\n").map { Component($0) }
    }

    func part1() -> Int {
        var bridge = Bridge()
        var result = [Bridge]()

        findConnected(0, &bridge, &result)

        let max = result.max { $0.strength < $1.strength }!
        return max.strength
    }

    func findConnected(_ start: Int, _ bridge: inout Bridge, _ result: inout [Bridge]) {
        let next = components
            .filter { $0.matches(start) }
            .filter { !bridge.uses($0) }

        if next.isEmpty {
            result.append(bridge)
            bridge = Bridge()
        } else {
            for part in next {
                var new = bridge.copy()
                new.add(part)
                findConnected(new.pins, &new, &result)
            }
        }
    }

    func part2() -> Int {
        var bridge = Bridge()
        var result = [Bridge]()

        findConnected(0, &bridge, &result)

        let length = result.max { $0.components.count < $1.components.count }!.components.count
        let longest = result.filter { $0.components.count == length }

        let max = longest.max { $0.strength < $1.strength }!
        return max.strength
    }
}
