import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day09Tests {
    @Test func testDay09_part1() throws {
        #expect(Day09(input: "{}").part1() == 1)
        #expect(Day09(input: "{{{}}}").part1() == 6)
        #expect(Day09(input: "{{},{}}").part1() == 5)
        #expect(Day09(input: "{{{},{},{{}}}}").part1() == 16)
        #expect(Day09(input: "{<a>,<a>,<a>,<a>}").part1() == 1)
        #expect(Day09(input: "{{<ab>},{<ab>},{<ab>},{<ab>}}").part1() == 9)
        #expect(Day09(input: "{{<!!>},{<!!>},{<!!>},{<!!>}}").part1() == 9)
        #expect(Day09(input: "{{<a!>},{<a!>},{<a!>},{<ab>}}").part1() == 3)
        #expect(Day09(input: "{{<!>},{<!>},{<!>},{<a>}}").part1() == 3)
    }

    @Test func testDay09_part2() throws {
        #expect(Day09(input: "<>").part2() == 0)
        #expect(Day09(input: "<random characters>").part2() == 17)
        #expect(Day09(input: "<<<<>").part2() == 3)
        #expect(Day09(input: "<{!>}>").part2() == 2)
        #expect(Day09(input: "<!!>").part2() == 0)
        #expect(Day09(input: "<!!!>>").part2() == 0)
        #expect(Day09(input: "<{o\"i!a,<{i<a>").part2() == 10)
    }
}
