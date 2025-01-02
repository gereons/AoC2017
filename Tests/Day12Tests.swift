import XCTest
@testable import AdventOfCode

@MainActor
final class Day12Tests: XCTestCase {
    let test = """
    0 <-> 2
    1 <-> 1
    2 <-> 0, 3, 4
    3 <-> 2, 4
    4 <-> 2, 3, 6
    5 <-> 6
    6 <-> 4, 5
    """

    func testDay12_1() throws {
        let day = Day12(input: self.test)
        XCTAssertEqual(day.part1(), 6)
    }

    func testDay12_2() throws {
        let day = Day12(input: self.test)
        XCTAssertEqual(day.part2(), 2)
    }
}
