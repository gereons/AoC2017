import XCTest
@testable import AdventOfCode

final class Day21Tests: XCTestCase {
    func testDay21_1() throws {
        let input = """
        ../.# => ##./#../...
        .#./..#/### => #..#/..../..../#..#
        """
        let day = Day21(rawInput: input)
        XCTAssertEqual(day.part1(iterations: 2), 12)
    }
}
