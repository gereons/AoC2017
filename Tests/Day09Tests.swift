import XCTest
@testable import AdventOfCode

@MainActor
final class Day09Tests: XCTestCase {
    func testDay09_1() throws {
        XCTAssertEqual(Day09(input: "{}").part1(), 1)
        XCTAssertEqual(Day09(input: "{{{}}}").part1(), 6)
        XCTAssertEqual(Day09(input: "{{},{}}").part1(), 5)
        XCTAssertEqual(Day09(input: "{{{},{},{{}}}}").part1(), 16)
        XCTAssertEqual(Day09(input: "{<a>,<a>,<a>,<a>}").part1(), 1)
        XCTAssertEqual(Day09(input: "{{<ab>},{<ab>},{<ab>},{<ab>}}").part1(), 9)
        XCTAssertEqual(Day09(input: "{{<!!>},{<!!>},{<!!>},{<!!>}}").part1(), 9)
        XCTAssertEqual(Day09(input: "{{<a!>},{<a!>},{<a!>},{<ab>}}").part1(), 3)
        XCTAssertEqual(Day09(input: "{{<!>},{<!>},{<!>},{<a>}}").part1(), 3)
    }

    func testDay09_2() throws {
        XCTAssertEqual(Day09(input: "<>").part2(), 0)
        XCTAssertEqual(Day09(input: "<random characters>").part2(), 17)
        XCTAssertEqual(Day09(input: "<<<<>").part2(), 3)
        XCTAssertEqual(Day09(input: "<{!>}>").part2(), 2)
        XCTAssertEqual(Day09(input: "<!!>").part2(), 0)
        XCTAssertEqual(Day09(input: "<!!!>>").part2(), 0)
        XCTAssertEqual(Day09(input: "<{o\"i!a,<{i<a>").part2(), 10)
    }
}
