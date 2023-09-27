import XCTest
@testable import AdventOfCode

final class Day19Tests: XCTestCase {
    let path = """
     |
     |  +--+
     A  |  C
 F---|----E|--+
     |  |  |  D
     +B-+  +--+

"""
    
    func testDay19_1() throws {

        let day = Day19(input: path)
        XCTAssertEqual(day.part1(), "ABCDEF")
    }

    func testDay19_2() throws {
        let day = Day19(input: path)
        XCTAssertEqual(day.part2(), 38)
    }
}
