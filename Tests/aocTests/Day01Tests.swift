import XCTest
@testable import AdventOfCode

final class Day01Tests: XCTestCase {
    func testDay01_1() throws {
        XCTAssertEqual(Day01(rawInput: "1122").part1(), 3)
        XCTAssertEqual(Day01(rawInput: "1111").part1(), 4)
        XCTAssertEqual(Day01(rawInput: "1234").part1(), 0)
        XCTAssertEqual(Day01(rawInput: "91212129").part1(), 9)
    }

    func testDay01_2() throws {
        XCTAssertEqual(Day01(rawInput: "1212").part2(), 6)
        XCTAssertEqual(Day01(rawInput: "1221").part2(), 0)
        XCTAssertEqual(Day01(rawInput: "123425").part2(), 4)
        XCTAssertEqual(Day01(rawInput: "123123").part2(), 12)
        XCTAssertEqual(Day01(rawInput: "12131415").part2(), 4)
    }
}
