import XCTest
@testable import AdventOfCode

final class Day10Tests: XCTestCase {
    func testDay10_1() throws {
        let day = Day10(input: "foo")
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay10_2() throws {
        let day = Day10(input: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
