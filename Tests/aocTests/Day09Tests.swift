import XCTest
@testable import AdventOfCode

final class Day09Tests: XCTestCase {
    func testDay09_1() throws {
        let day = Day09(input: "foo")
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay09_2() throws {
        let day = Day09(input: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
