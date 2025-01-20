import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day05Tests {
    @Test func testDay05_part1() throws {
        let input = """
            0
            3
            0
            1
            -3
            """
        let day = Day05(input: input)
        #expect(day.part1() == 5)
    }

    @Test func testDay05_part2() throws {
        let input = """
            0
            3
            0
            1
            -3
            """
        let day = Day05(input: input)
        #expect(day.part2() == 10)
    }
}
