import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day20Tests {
    @Test func testDay20_part1() throws {
        let input = """
p=<3,0,0>, v=<2,0,0>, a=<-1,0,0>
p=<4,0,0>, v=<0,0,0>, a=<-2,0,0>
"""
        let day = Day20(input: input)
        #expect(day.part1() == 0)
    }

    @Test func testDay20_part2() throws {
        let input = """
p=<-6,0,0>, v=<3,0,0>, a=<0,0,0>
p=<-4,0,0>, v=<2,0,0>, a=<0,0,0>
p=<-2,0,0>, v=<1,0,0>, a=<0,0,0>
p=<3,0,0>, v=<-1,0,0>, a=<0,0,0>
"""
        let day = Day20(input: input)
        #expect(day.part2() == 1)
    }
}
