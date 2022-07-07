import XCTest
@testable import AdventOfCode

final class Day05Tests: XCTestCase {
    func testDay05_1() throws {
        let input = """
            0
            3
            0
            1
            -3
            """
        let day = Day05(rawInput: input)
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
        let day = Day05(rawInput: input)
        XCTAssertEqual(day.part2(), 10)
    }
}
