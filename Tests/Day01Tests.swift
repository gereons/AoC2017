import Testing
@testable import AdventOfCode

@MainActor
@Suite struct Day01Tests {
    @Test func testDay01_part1() async throws {
        #expect(Day01(input: "1122").part1() == 3)
        #expect(Day01(input: "1111").part1() == 4)
        #expect(Day01(input: "1234").part1() == 0)
        #expect(Day01(input: "91212129").part1() == 9)
    }

    @Test func testDay01_part2() throws {
        #expect(Day01(input: "1212").part2() == 6)
        #expect(Day01(input: "1221").part2() == 0)
        #expect(Day01(input: "123425").part2() == 4)
        #expect(Day01(input: "123123").part2() == 12)
        #expect(Day01(input: "12131415").part2() == 4)
    }
}
