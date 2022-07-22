import XCTest
@testable import AdventOfCode

final class Day17Tests: XCTestCase {
    func testDay17_1() throws {
        let day = Day17(rawInput: "3")
        XCTAssertEqual(day.part1(), 638)
    }

    func testDay17_2() throws {
        let day = Day17(rawInput: "3")
        XCTAssertEqual(day.part2(), 1226)
    }
}
