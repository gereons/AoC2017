import XCTest
@testable import AdventOfCode


final class Day23Tests: XCTestCase {
    func testDay23_1() throws {
        let day = Day23()
        XCTAssertEqual(day.part1(), 6241)
    }

    func testDay23_2() throws {
        let day = Day23()
        
        XCTAssertEqual(day.part2(), 909)
    }
}
