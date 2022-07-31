import XCTest
@testable import AdventOfCode

final class Day22Tests: XCTestCase {
    func testDay22_1() throws {
        let grid = """
        ..#
        #..
        ...
        """
        let day = Day22(rawInput: grid)
        XCTAssertEqual(day.part1(loops: 7), 5)
        XCTAssertEqual(day.part1(loops: 70), 41)
        XCTAssertEqual(day.part1(), 5587)
    }

    func testDay22_2() throws {
        let grid = """
        ..#
        #..
        ...
        """
        let day = Day22(rawInput: grid)
        XCTAssertEqual(day.part2(loops: 100), 26)
        XCTAssertEqual(day.part2(loops: 10000000), 2511944)
    }
}
