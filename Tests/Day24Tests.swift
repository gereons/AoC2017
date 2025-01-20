import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day24Tests {
    let input = """
        0/2
        2/2
        2/3
        3/4
        3/5
        0/1
        10/1
        9/10
        """
    
    @Test func testDay24_part1() throws {
        let day = Day24(input: input)
        #expect(day.part1() == 31)
    }

    @Test func testDay24_part2() throws {
        let day = Day24(input: input)
        #expect(day.part2() == 19)
    }
}
