import XCTest
@testable import AdventOfCode

final class Day15Tests: XCTestCase {
    func testDay15_1() throws {
        let day = Day15(input: "foo")
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay15_2() throws {
        let day = Day15(input: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
