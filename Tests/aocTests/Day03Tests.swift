import XCTest
@testable import AdventOfCode

final class Day03Tests: XCTestCase {
    func testDay03_1() throws {
        let day = Day03(input: "foo")
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay03_2() throws {
        let day = Day03(input: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
