import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day02Tests {
    let input1 = """
        5 1 9 5
        7 5 3
        2 4 6 8
        """
    @Test func testDay02_part1() throws {
        let day = Day02(input: input1)
        #expect(day.part1() == 18)
    }

    let input2 = """
        5 9 2 8
        9 4 7 3
        3 8 6 5
        """

    @Test func testDay02_part2() throws {
        let day = Day02(input: input2)
        #expect(day.part2() == 9)
    }
}
