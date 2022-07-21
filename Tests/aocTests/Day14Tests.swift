import XCTest
@testable import AdventOfCode

final class Day14Tests: XCTestCase {
    func testDay14_1() throws {
        let day = Day14(rawInput: "flqrgnkx")
        XCTAssertEqual(day.part1(), 8108)
    }

    func testDay14_2() throws {
        let day = Day14(rawInput: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
