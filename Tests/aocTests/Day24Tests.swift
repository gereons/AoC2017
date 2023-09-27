import XCTest
@testable import AdventOfCode

final class Day24Tests: XCTestCase {
    let input = """
        0/2
        2/2
        2/3
        3/4
        3/5
        0/1
        10/1
        9/10
        """
    
    func testDay24_1() throws {
        let day = Day24(input: input)
        XCTAssertEqual(day.part1(), 31)
    }

    func testDay24_2() throws {
        let day = Day24(input: input)
        XCTAssertEqual(day.part2(), 19)
    }
}
