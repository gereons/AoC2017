import XCTest
@testable import AdventOfCode

final class Day11Tests: XCTestCase {
    func testDay11_1() throws {
        XCTAssertEqual(Day11(input: "ne").part1(), 1)
        XCTAssertEqual(Day11(input: "ne,ne,ne").part1(), 3)
        XCTAssertEqual(Day11(input: "ne,ne,sw,sw").part1(), 0)
        XCTAssertEqual(Day11(input: "ne,ne,s,s").part1(), 2)
        XCTAssertEqual(Day11(input: "se,se").part1(), 2)
        XCTAssertEqual(Day11(input: "se,sw,se,sw,sw").part1(), 3)
        XCTAssertEqual(Day11(input: "s,s,sw").part1(), 3)
    }

    func testDay11_2() throws {
        let day = Day11(input: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
