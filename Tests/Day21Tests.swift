import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day21Tests {
    @Test func testDay21_part1() throws {
        let input = """
        ../.# => ##./#../...
        .#./..#/### => #..#/..../..../#..#
        """
        let day = Day21(input: input)
        #expect(day.part1(iterations: 2) == 12)
    }
}
