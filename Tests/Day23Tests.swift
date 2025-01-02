import XCTest
@testable import AdventOfCode

@MainActor
final class Day23Tests: XCTestCase {
    func testDay23_1() throws {
        let day = Day23(input: Day23.input)
        XCTAssertEqual(day.part1(), 6241)
    }

    func testDay23_2() throws {
        let day = Day23(input: Day23.input)
        
        XCTAssertEqual(day.part2(), 909)
    }
}
