import XCTest
@testable import AdventOfCode

final class Day18Tests: XCTestCase {
    func testDay18_1() throws {
        let day = Day18(input: "foo")
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay18_2() throws {
        let day = Day18(input: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
