import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day22Tests {
    @Test func testDay22_part1() throws {
        let grid = """
        ..#
        #..
        ...
        """
        let day = Day22(input: grid)
        #expect(day.part1(loops: 7) == 5)
        #expect(day.part1(loops: 70) == 41)
        #expect(day.part1() == 5587)
    }

    @Test func testDay22_part2() throws {
        let grid = """
        ..#
        #..
        ...
        """
        let day = Day22(input: grid)
        #expect(day.part2(loops: 100) == 26)
        #expect(day.part2(loops: 10000000) == 2511944)
    }
}
