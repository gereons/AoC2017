import XCTest
@testable import AdventOfCode

final class Day17Tests: XCTestCase {
    func testDay17_1() throws {
        let day = Day17(input: "foo")
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay17_2() throws {
        let day = Day17(input: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
