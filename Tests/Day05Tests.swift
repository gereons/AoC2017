import XCTest
@testable import AdventOfCode

@MainActor
final class Day05Tests: XCTestCase {
    func testDay05_1() throws {
        let input = """
            0
            3
            0
            1
            -3
            """
        let day = Day05(input: input)
        XCTAssertEqual(day.part1(), 5)
    }

    func testDay05_2() throws {
        let input = """
            0
            3
            0
            1
            -3
            """
        let day = Day05(input: input)
        XCTAssertEqual(day.part2(), 10)
    }
}
