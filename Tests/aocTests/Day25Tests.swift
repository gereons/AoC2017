import XCTest
@testable import AdventOfCode

final class Day25Tests: XCTestCase {
    func testDay25_1() throws {
        let day = Day25(rawInput: "foo")
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay25_2() throws {
        let day = Day25(rawInput: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
