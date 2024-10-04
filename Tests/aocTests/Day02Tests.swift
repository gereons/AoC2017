import XCTest
@testable import AdventOfCode

@MainActor
final class Day02Tests: XCTestCase {
    let input1 = """
        5 1 9 5
        7 5 3
        2 4 6 8
        """
    func testDay02_1() throws {
        let day = Day02(input: input1)
        XCTAssertEqual(day.part1(), 18)
    }

    let input2 = """
        5 9 2 8
        9 4 7 3
        3 8 6 5
        """

    func testDay02_2() throws {
        let day = Day02(input: input2)
        XCTAssertEqual(day.part2(), 9)
    }
}
