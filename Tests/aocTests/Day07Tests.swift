import XCTest
@testable import AdventOfCode

final class Day07Tests: XCTestCase {
    let input = """
pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)
"""

    func testDay07_1() throws {
        let day = Day07(rawInput: input)
        XCTAssertEqual(day.part1(), "tknk")
    }

    func testDay07_2() throws {
        let day = Day07(rawInput: input)
        XCTAssertEqual(day.part2(), 60)
    }
}
