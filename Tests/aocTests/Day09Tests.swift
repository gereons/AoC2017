import XCTest
@testable import AdventOfCode

final class Day09Tests: XCTestCase {
    func testDay09_1() throws {
        XCTAssertEqual(Day09(rawInput: "{}").part1(), 1)
        XCTAssertEqual(Day09(rawInput: "{{{}}}").part1(), 6)
        XCTAssertEqual(Day09(rawInput: "{{},{}}").part1(), 5)
        XCTAssertEqual(Day09(rawInput: "{{{},{},{{}}}}").part1(), 16)
        XCTAssertEqual(Day09(rawInput: "{<a>,<a>,<a>,<a>}").part1(), 1)
        XCTAssertEqual(Day09(rawInput: "{{<ab>},{<ab>},{<ab>},{<ab>}}").part1(), 9)
        XCTAssertEqual(Day09(rawInput: "{{<!!>},{<!!>},{<!!>},{<!!>}}").part1(), 9)
        XCTAssertEqual(Day09(rawInput: "{{<a!>},{<a!>},{<a!>},{<ab>}}").part1(), 3)
        XCTAssertEqual(Day09(rawInput: "{{<!>},{<!>},{<!>},{<a>}}").part1(), 3)
    }

    func testDay09_2() throws {
        XCTAssertEqual(Day09(rawInput: "<>").part2(), 0)
        XCTAssertEqual(Day09(rawInput: "<random characters>").part2(), 17)
        XCTAssertEqual(Day09(rawInput: "<<<<>").part2(), 3)
        XCTAssertEqual(Day09(rawInput: "<{!>}>").part2(), 2)
        XCTAssertEqual(Day09(rawInput: "<!!>").part2(), 0)
        XCTAssertEqual(Day09(rawInput: "<!!!>>").part2(), 0)
        XCTAssertEqual(Day09(rawInput: "<{o\"i!a,<{i<a>").part2(), 10)
    }
}
