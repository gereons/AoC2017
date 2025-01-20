import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day04Tests {
    @Test func testDay04_part1() throws {
        let input = """
            aa bb cc dd ee
            aa bb cc dd aa
            aa bb cc dd aaa
            """
        let day = Day04(input: input)
        #expect(day.part1() == 2)
    }

    @Test func testDay04_part2() throws {
        let input = """
            abcde fghij
            abcde xyz ecdab
            a ab abc abd abf abj
            iiii oiii ooii oooi oooo
            oiii ioii iioi iiio
            """
        let day = Day04(input: input)
        #expect(day.part2() == 3)
    }
}
