import XCTest
@testable import AdventOfCode

@MainActor
final class Day21Tests: XCTestCase {
    func testDay21_1() throws {
        let input = """
        ../.# => ##./#../...
        .#./..#/### => #..#/..../..../#..#
        """
        let day = Day21(input: input)
        XCTAssertEqual(day.part1(iterations: 2), 12)
    }
}
