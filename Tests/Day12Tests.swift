import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day12Tests {
    let test = """
    0 <-> 2
    1 <-> 1
    2 <-> 0, 3, 4
    3 <-> 2, 4
    4 <-> 2, 3, 6
    5 <-> 6
    6 <-> 4, 5
    """

    @Test func testDay12_part1() throws {
        let day = Day12(input: self.test)
        #expect(day.part1() == 6)
    }

    @Test func testDay12_part2() throws {
        let day = Day12(input: self.test)
        #expect(day.part2() == 2)
    }
}
