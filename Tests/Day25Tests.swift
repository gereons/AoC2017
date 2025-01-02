import XCTest
@testable import AdventOfCode

@MainActor
final class Day25Tests: XCTestCase {
    let blueprint = """
Begin in state A.
Perform a diagnostic checksum after 6 steps.

In state A:
  If the current value is 0:
    - Write the value 1.
    - Move one slot to the right.
    - Continue with state B.
  If the current value is 1:
    - Write the value 0.
    - Move one slot to the left.
    - Continue with state B.

In state B:
  If the current value is 0:
    - Write the value 1.
    - Move one slot to the left.
    - Continue with state A.
  If the current value is 1:
    - Write the value 1.
    - Move one slot to the right.
    - Continue with state A.
"""

    func testDay25_1() throws {
        let day = Day25(input: blueprint)
        XCTAssertEqual(day.part1(), 3)
    }
}
