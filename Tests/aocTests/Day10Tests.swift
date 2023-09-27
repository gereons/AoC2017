import XCTest
@testable import AdventOfCode

final class Day10Tests: XCTestCase {
    func testBuffer() throws {
        let cb = KnotHash.FixedSizeCircularBuffer(with: [0,1,2,3,4])

        XCTAssertEqual(cb.section(from: 0, length: 2), [0,1])
        XCTAssertEqual(cb.section(from: 3, length: 5), [3,4,0,1,2])
    }
    
    func testBufferAssign() throws {
        var cb = KnotHash.FixedSizeCircularBuffer(with: [0,1,2,3,4])

        cb.store([9,8,7], at: 0)
        XCTAssertEqual(cb.section(from: 0, length: 5), [9,8,7,3,4])

        var cb2 = KnotHash.FixedSizeCircularBuffer(with: [0,1,2,3,4])

        cb2.store([9,8,7], at: 4)
        XCTAssertEqual(cb2.section(from: 0, length: 5), [8,7,2,3,9])
    }

    func testDay10_1() throws {
        let day = Day10(input: "3,4,1,5", list: [0,1,2,3,4])
        XCTAssertEqual(day.part1(), 12)
    }

    func testDay10_2() throws {
        XCTAssertEqual(Day10(input: "").part2(), "a2582a3a0e66e6e86e3812dcb672a272")
        XCTAssertEqual(Day10(input: "AoC 2017").part2(), "33efeb34ea91902bb2f59c9920caa6cd")
        XCTAssertEqual(Day10(input: "1,2,3").part2(), "3efbe78a8d82f29979031a4aa0b16a9d")
        XCTAssertEqual(Day10(input: "1,2,4").part2(), "63960835bcdc130f0b66d7ff4f6a5a8e")
    }
}
