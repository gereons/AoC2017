import XCTest
@testable import AdventOfCode

final class Day23Tests: XCTestCase {
    func testDay23_1() throws {
        let day = Day23(input: "foo")
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay23_2() throws {
        let day = Day23(input: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
