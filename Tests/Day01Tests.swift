import XCTest
@testable import AdventOfCode

@MainActor
final class Day01Tests: XCTestCase {
    func testDay01_1() async throws {
        XCTAssertEqual(Day01(input: "1122").part1(), 3)
        XCTAssertEqual(Day01(input: "1111").part1(), 4)
        XCTAssertEqual(Day01(input: "1234").part1(), 0)
        XCTAssertEqual(Day01(input: "91212129").part1(), 9)
    }

    func testDay01_2() throws {
        XCTAssertEqual(Day01(input: "1212").part2(), 6)
        XCTAssertEqual(Day01(input: "1221").part2(), 0)
        XCTAssertEqual(Day01(input: "123425").part2(), 4)
        XCTAssertEqual(Day01(input: "123123").part2(), 12)
        XCTAssertEqual(Day01(input: "12131415").part2(), 4)
    }
}
