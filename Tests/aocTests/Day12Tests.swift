import XCTest
@testable import AdventOfCode

final class Day12Tests: XCTestCase {
    func testDay12_1() throws {
        let day = Day12(input: "foo")
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay12_2() throws {
        let day = Day12(input: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
