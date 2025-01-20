import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day08Tests {
    let input = """
    b inc 5 if a > 1
    a inc 1 if b < 5
    c dec -10 if a >= 1
    c inc -20 if c == 10
    """

    @Test func testDay08_part1() throws {
        let day = Day08(input: input)
        #expect(day.part1() == 1)
    }

    @Test func testDay08_part2() throws {
        let day = Day08(input: input)
        #expect(day.part2() == 10)
    }
}
