//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/13
//

import AoCTools

class Firewall {
    let depth: Int
    let range: Int
    private let scannerPositions: [Int]

    var severity: Int { depth * range }

    init(depth: Int, range: Int) {
        self.depth = depth
        self.range = range
        self.scannerPositions = [Int](0..<range) + [Int](1..<range-1).reversed()
    }

    func scannerPosition(at tick: Int) -> Int {
        return scannerPositions[tick % scannerPositions.count]
    }

    convenience init(_ string: String) {
        let parts = string.components(separatedBy: ": ")
        self.init(depth: Int(parts[0])!, range: Int(parts[1])!)
    }
}

final class Day13: AOCDay {
    let firewalls: [Int: Firewall]
    let maxDepth: Int

    init(input: String? = nil) {
        let input = input ?? Self.input
        let firewalls = input.components(separatedBy: "\n").map { Firewall($0) }

        self.firewalls = Dictionary(uniqueKeysWithValues: zip(firewalls.map { $0.depth }, firewalls))
        maxDepth = self.firewalls.keys.max(by: <)!
    }

    func part1() -> Int {
        let severity = tripSeverity(delay: 0, stopWhenCaught: false)
        return severity
    }

    private func tripSeverity(delay: Int, stopWhenCaught: Bool) -> Int {
        var severity = 0
        var packetDepth = -1
        var picoSecond = -1
        while packetDepth <= maxDepth {
            picoSecond += 1
            packetDepth += 1
            if let fw = firewalls[packetDepth] {
                if fw.scannerPosition(at: picoSecond + delay) == 0 {
                    // print("caught at \(packetDepth) for \(fw.severity)")
                    severity += fw.severity
                    if stopWhenCaught {
                        return 1
                    }
                }
            }
        }
        return severity
    }

    func part2() -> Int {
        for delay in 0 ... 10_000_000 {
            let severity = tripSeverity(delay: delay, stopWhenCaught: true)
            if severity == 0 {
                return delay
            }
        }
        return -1
    }
}
