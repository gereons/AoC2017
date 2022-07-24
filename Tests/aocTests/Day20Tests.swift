import XCTest
@testable import AdventOfCode

final class Day20Tests: XCTestCase {
    func testDay20_1() throws {
        let input = """
p=<3,0,0>, v=<2,0,0>, a=<-1,0,0>
p=<4,0,0>, v=<0,0,0>, a=<-2,0,0>
"""
        let day = Day20(rawInput: input)
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay20_2() throws {
        let input = """
p=<-6,0,0>, v=<3,0,0>, a=<0,0,0>
p=<-4,0,0>, v=<2,0,0>, a=<0,0,0>
p=<-2,0,0>, v=<1,0,0>, a=<0,0,0>
p=<3,0,0>, v=<-1,0,0>, a=<0,0,0>
"""
        let day = Day20(rawInput: input)
        XCTAssertEqual(day.part2(), 1)
    }
}
