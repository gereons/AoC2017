import XCTest
@testable import AdventOfCode

final class Day01Tests: XCTestCase {
    func testDay01_1() throws {
        XCTAssertEqual(Day01(input: "1122").part1(), 3)
        XCTAssertEqual(Day01(input: "1111").part1(), 4)
        XCTAssertEqual(Day01(input: "1234").part1(), 0)
        XCTAssertEqual(Day01(input: "91212129").part1(), 9)
    }

    func testDay01_2() throws {
        let day = Day01(input: "bar")
        XCTAssertEqual(day.part2(), 0)
    }
}
