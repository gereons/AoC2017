import XCTest
@testable import AdventOfCode

final class Day16Tests: XCTestCase {
    func testDay16_1() throws {
        let day = Day16(rawInput: "s1,x3/4,pe/b", programs: "abcde")
        XCTAssertEqual(day.part1(), "baedc")
    }

    func testDay16_2() throws {
        let day = Day16(rawInput: "bar")
        XCTAssertEqual(day.part2(), "")
    }
}
