import XCTest
@testable import AdventOfCode

@MainActor
final class Day14Tests: XCTestCase {
    func testDay14_1() throws {
        let day = Day14(input: "flqrgnkx")
        XCTAssertEqual(day.part1(), 8108)
    }

    func testDay14_2() throws {
        let day = Day14(input: "flqrgnkx")
        XCTAssertEqual(day.part2(), 1242)
    }
}
