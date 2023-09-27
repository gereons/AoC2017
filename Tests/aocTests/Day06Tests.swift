import XCTest
@testable import AdventOfCode

final class Day06Tests: XCTestCase {
    func testDay06_1() throws {
        let day = Day06(input: "0 2 7 0")
        XCTAssertEqual(day.part1(), 5)
    }

    func testDay06_2() throws {
        let day = Day06(input: "0 2 7 0")
        XCTAssertEqual(day.part2(), 4)
    }
}
