import XCTest
@testable import AdventOfCode

final class Day19Tests: XCTestCase {
    func testDay19_1() throws {
        let day = Day19(input: "foo")
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay19_2() throws {
        let day = Day19(input: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
