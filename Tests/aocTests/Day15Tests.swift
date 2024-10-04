import XCTest
@testable import AdventOfCode

@MainActor
final class Day15Tests: XCTestCase {
    func testDay15_1() throws {
        let day = Day15(startA: 65, startB: 8921)
        XCTAssertEqual(day.part1(), 588)
    }

    func testDay15_2() throws {
        let day = Day15(startA: 65, startB: 8921)
        XCTAssertEqual(day.part2(), 309)
    }
}
