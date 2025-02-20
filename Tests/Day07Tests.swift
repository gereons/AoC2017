import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day07Tests {
    let input = """
pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)
"""

    @Test func testDay07_part1() throws {
        let day = Day07(input: input)
        #expect(day.part1() == "tknk")
    }

    @Test func testDay07_part2() throws {
        let day = Day07(input: input)
        #expect(day.part2() == 60)
    }
}
