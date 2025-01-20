import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day17Tests {
    @Test func testDay17_part1() throws {
        let day = Day17(input: "3")
        #expect(day.part1() == 638)
    }
}
