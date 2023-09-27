import XCTest
@testable import AdventOfCode

final class Day13Tests: XCTestCase {
    let test = """
    0: 3
    1: 2
    4: 4
    6: 4
    """

    func testDay13_1() throws {
        let day = Day13(input: test)
        XCTAssertEqual(day.part1(), 24)
    }

    func testDay13_2() throws {
        let day = Day13(input: test)
        XCTAssertEqual(day.part2(), 10)
    }
}
