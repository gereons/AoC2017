import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day14Tests {
    @Test func testDay14_part1() throws {
        let day = Day14(input: "flqrgnkx")
        #expect(day.part1() == 8108)
    }

    @Test func testDay14_part2() throws {
        let day = Day14(input: "flqrgnkx")
        #expect(day.part2() == 1242)
    }
}
