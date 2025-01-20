import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day16Tests {
    @Test func testDay16_part1() throws {
        let day = Day16(input: "s1,x3/4,pe/b", programs: "abcde")
        #expect(day.part1() == "baedc")
    }
}
