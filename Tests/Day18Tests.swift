import XCTest
@testable import AdventOfCode

@MainActor
final class Day18Tests: XCTestCase {
    func testDay18_1() throws {
        let program = """
        set a 1
        add a 2
        mul a a
        mod a 5
        snd a
        set a 0
        rcv a
        jgz a -1
        set a 1
        jgz a -2
        """
        let day = Day18(input: program)
        XCTAssertEqual(day.part1(), 4)
    }

    func testDay18_2() throws {
        let program = """
        snd 1
        snd 2
        snd p
        rcv a
        rcv b
        rcv c
        rcv d
        """
        let day = Day18(input: program)
        XCTAssertEqual(day.part2(), 3)
    }
}
