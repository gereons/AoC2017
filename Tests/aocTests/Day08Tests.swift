import XCTest
@testable import AdventOfCode

final class Day08Tests: XCTestCase {
    let input = """
    b inc 5 if a > 1
    a inc 1 if b < 5
    c dec -10 if a >= 1
    c inc -20 if c == 10
    """

    func testDay08_1() throws {
        let day = Day08(input: input)
        XCTAssertEqual(day.part1(), 1)
    }

    func testDay08_2() throws {
        let day = Day08(input: input)
        XCTAssertEqual(day.part2(), 10)
    }
}
