import XCTest
@testable import AdventOfCode

@MainActor
final class Day17Tests: XCTestCase {
    func testDay17_1() throws {
        let day = Day17(input: "3")
        XCTAssertEqual(day.part1(), 638)
    }
}
