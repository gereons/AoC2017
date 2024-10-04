import XCTest
@testable import AdventOfCode

@MainActor
final class Day04Tests: XCTestCase {
    func testDay04_1() throws {
        let input = """
            aa bb cc dd ee
            aa bb cc dd aa
            aa bb cc dd aaa
            """
        let day = Day04(input: input)
        XCTAssertEqual(day.part1(), 2)
    }

    func testDay04_2() throws {
        let input = """
            abcde fghij
            abcde xyz ecdab
            a ab abc abd abf abj
            iiii oiii ooii oooi oooo
            oiii ioii iioi iiio
            """
        let day = Day04(input: input)
        XCTAssertEqual(day.part2(), 3)
    }
}
