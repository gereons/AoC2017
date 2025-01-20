import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day11Tests {
    @Test func testDay11_part1() throws {
        #expect(Day11(input: "ne").part1() == 1)
        #expect(Day11(input: "ne,ne,ne").part1() == 3)
        #expect(Day11(input: "ne,ne,sw,sw").part1() == 0)
        #expect(Day11(input: "ne,ne,s,s").part1() == 2)
        #expect(Day11(input: "se,se").part1() == 2)
        #expect(Day11(input: "se,sw,se,sw,sw").part1() == 3)
        #expect(Day11(input: "s,s,sw").part1() == 3)
    }

    @Test func testDay11_part2() throws {
        let day = Day11(input: "bar")
        #expect(day.part2() == 0)
    }
}
