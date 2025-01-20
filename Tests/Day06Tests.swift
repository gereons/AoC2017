import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day06Tests {
    @Test func testDay06_part1() throws {
        let day = Day06(input: "0 2 7 0")
        #expect(day.part1() == 5)
    }

    @Test func testDay06_part2() throws {
        let day = Day06(input: "0 2 7 0")
        #expect(day.part2() == 4)
    }
}
