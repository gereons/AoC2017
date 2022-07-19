import XCTest
@testable import AdventOfCode

final class Day11Tests: XCTestCase {
    func testDay11_1() throws {
        XCTAssertEqual(Day11(rawInput: "ne").part1(), 1)
        XCTAssertEqual(Day11(rawInput: "ne,ne,ne").part1(), 3)
        XCTAssertEqual(Day11(rawInput: "ne,ne,sw,sw").part1(), 0)
        XCTAssertEqual(Day11(rawInput: "ne,ne,s,s").part1(), 2)
        XCTAssertEqual(Day11(rawInput: "se,se").part1(), 2)
        XCTAssertEqual(Day11(rawInput: "se,sw,se,sw,sw").part1(), 3)
        XCTAssertEqual(Day11(rawInput: "s,s,sw").part1(), 3)
    }

    func testDay11_2() throws {
        let day = Day11(rawInput: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
