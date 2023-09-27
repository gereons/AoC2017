import XCTest
@testable import AdventOfCode

final class Day03Tests: XCTestCase {
    func testDay03_1() throws {
//        17  16  15  14  13
//        18   5   4   3  12
//        19   6   1   2  11
//        20   7   8   9  10
//        21  22  23---> ...
        XCTAssertEqual(Day03(input: "1").part1(), 0)
        XCTAssertEqual(Day03(input: "2").part1(), 1)
        XCTAssertEqual(Day03(input: "12").part1(), 3)
        XCTAssertEqual(Day03(input: "23").part1(), 2)
        XCTAssertEqual(Day03(input: "1024").part1(), 31)
    }

    func testDay03_2() throws {
//        147  142  133  122   59
//        304    5    4    2   57
//        330   10    1    1   54
//        351   11   23   25   26
//        362  747  806--->   ...
        XCTAssertEqual(Day03(input: "5").part2(), 10)
        XCTAssertEqual(Day03(input: "10").part2(), 11)
        XCTAssertEqual(Day03(input: "11").part2(), 23)
        XCTAssertEqual(Day03(input: "59").part2(), 122)
        XCTAssertEqual(Day03(input: "747").part2(), 806)
    }
}
