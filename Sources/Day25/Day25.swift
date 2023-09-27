//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/25
//

import AoCTools

/*
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
 */

private class TuringMachine {
    let startState: String
    let steps: Int
    let states: [State]
    private let stateById: [String: State]

    private(set) var tape = [Int: Int]()
    private var position = 0
    private var currentState: String

    struct Action {
        let write: Int
        let move: Int
        let nextState: String

        init(write: String, move: String, nextState: String) {
            self.write = Int(write)!
            self.move = move == "right" ? 1 : -1
            self.nextState = nextState
        }
    }

    struct State {
        static let regexes = [
            Regex(pattern: #"In state (.*):"#),
            Regex(pattern: #"  If the current value is (\d*):"#),
            Regex(pattern: #"    - Write the value (\d*)."#),
            Regex(pattern: #"    - Move one slot to the (.*)."#),
            Regex(pattern: #"    - Continue with state (.*)."#),
            Regex(pattern: #"  If the current value is (\d*):"#),
            Regex(pattern: #"    - Write the value (\d*)."#),
            Regex(pattern: #"    - Move one slot to the (.*)."#),
            Regex(pattern: #"    - Continue with state (.*)."#),
        ]

        let id: String
        let actions: [String: Action]

        init(_ lines: ArraySlice<String>) {
            let values = lines
                .dropFirst()
                .enumerated()
                .map { index, line in
                    Self.regexes[index].matches(in: line)
                }
                .flatMap { $0 }

            self.id = values[0]
            let action1 = Action(write: values[2], move: values[3], nextState: values[4])
            let action2 = Action(write: values[6], move: values[7], nextState: values[8])

            self.actions = [
                values[1]: action1,
                values[5]: action2
            ]
        }
    }

    init(_ blueprint: String) {
        let lines = blueprint.components(separatedBy: "\n")
        assert((lines.count-2).isMultiple(of: 10))

        let start = Regex(pattern: #"Begin in state (.*)."#)
        startState = start.matches(in: lines[0]).first!
        let steps = Regex(pattern: #"Perform a diagnostic checksum after (\d*) steps."#)
        self.steps = Int(steps.matches(in: lines[1]).first!)!

        var states = [State]()
        for start in stride(from: 2, through: lines.count-1, by: 10) {
            let chunk = lines[start..<start+10]
            states.append(State(chunk))
        }
        self.states = states

        currentState = startState
        stateById = Dictionary.init(uniqueKeysWithValues: zip(states.map { $0.id}, states))
    }

    func executeStep() {
        let state = stateById[currentState]!
        let value = tape[position, default: 0]

        let action = state.actions["\(value)"]!

        tape[position] = action.write
        position += action.move
        currentState = action.nextState
    }

    func execute() {
        for _ in 0..<steps {
            executeStep()
        }
    }
}

final class Day25: AOCDay {
    private let turingMachine: TuringMachine
    init(input: String? = nil) {
        let input = input ?? Self.input

        turingMachine = TuringMachine(input)
    }

    func part1() -> Int {
        turingMachine.execute()
        let ones = turingMachine.tape.values.filter { $0 == 1 }.count
        return ones
    }

    func part2() -> Int {
        return 0
    }
}
