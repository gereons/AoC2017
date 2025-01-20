import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day15Tests {
    @Test func testDay15_part1() throws {
        let day = Day15(startA: 65, startB: 8921)
        #expect(day.part1() == 588)
    }

    @Test func testDay15_part2() throws {
        let day = Day15(startA: 65, startB: 8921)
        #expect(day.part2() == 309)
    }
}
