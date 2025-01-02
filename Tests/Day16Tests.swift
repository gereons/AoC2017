import XCTest
@testable import AdventOfCode

@MainActor
final class Day16Tests: XCTestCase {
    func testDay16_1() throws {
        let day = Day16(input: "s1,x3/4,pe/b", programs: "abcde")
        XCTAssertEqual(day.part1(), "baedc")
    }
}
