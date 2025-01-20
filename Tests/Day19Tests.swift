import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day19Tests {
    let path = """
     |
     |  +--+
     A  |  C
 F---|----E|--+
     |  |  |  D
     +B-+  +--+

"""
    
    @Test func testDay19_part1() throws {

        let day = Day19(input: path)
        #expect(day.part1() == "ABCDEF")
    }

    @Test func testDay19_part2() throws {
        let day = Day19(input: path)
        #expect(day.part2() == 38)
    }
}
