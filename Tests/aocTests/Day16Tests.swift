import XCTest
@testable import AdventOfCode

final class Day16Tests: XCTestCase {
    func testDay16_1() throws {
        let day = Day16(input: "foo")
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay16_2() throws {
        let day = Day16(input: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
