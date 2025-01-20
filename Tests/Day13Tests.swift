import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day13Tests {
    let test = """
    0: 3
    1: 2
    4: 4
    6: 4
    """

    @Test func testDay13_part1() throws {
        let day = Day13(input: test)
        #expect(day.part1() == 24)
    }

    @Test func testDay13_part2() throws {
        let day = Day13(input: test)
        #expect(day.part2() == 10)
    }
}
