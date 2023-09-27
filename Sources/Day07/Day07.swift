//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/7
//

import AoCTools
import Foundation

private struct Program {
    let name: String
    let weight: Int
    let carrying: [String]

    static let regex = try! NSRegularExpression(pattern: #"(.*) \((\d*)\)( -> (.*))?"#)

    init(_ string: String) {
        let range = NSRange(location: 0, length: string.count)
        let matches = Self.regex.matches(in: string, options: [], range: range)

        let match = matches.last!
        self.name = String(string[Range(match.range(at: 1), in: string)!])
        self.weight = Int(String(string[Range(match.range(at: 2), in: string)!]))!
        if let carryRange = Range(match.range(at: 4), in: string) {
            let carry = String(string[carryRange])
            self.carrying = carry.components(separatedBy: ", ")
        } else {
            self.carrying = []
        }
    }
}

extension Program: CustomStringConvertible {
    var description: String {
        return "\(name) (\(weight))"
    }
}

private typealias Node = TreeNode<Program>

extension Node {
    var name: String { value.name }
    var weight: Int { value.weight }
    var treeWeight: Int { reduce(0) { $0 + $1.weight } }

    func isUnbalancedAt() -> Int? {
        let weights = children.map { $0.treeWeight }
        if Set(weights).count > 1 {
            let max = weights.max(by: <)
            return weights.firstIndex { $0 == max }
        } else {
            return nil
        }
    }
}

final class Day07: AOCDay {
    private let programs: [Program]
    private var root: Node?

    init(input: String? = nil) {
        let input = input ?? Self.input
        programs = input.components(separatedBy: "\n").map { Program($0) }
    }

    func part1() -> String {
        root = buildTree()
        return root!.value.name
    }

    func part2() -> Int {
        if root == nil { root = buildTree() }

        var lastUnbalancedNode: Node?
        root!.visitAll { node, level in
            if let index = node.isUnbalancedAt() {
                lastUnbalancedNode = node.children[index]
            }
        }

        if let node = lastUnbalancedNode {
            let weights = node.parent!.children.compactMap { $0.treeWeight }
            let max = weights.max(by: <)!
            let min = weights.min(by: <)!
            return node.weight - (max - min)
        }
        return 0
    }

    private func buildTree() -> Node {
        var carriedBy = [String: Program]()
        var byName = [String: Program]()
        for program in programs {
            byName[program.name] = program
            for carried in program.carrying {
                carriedBy[carried] = program
            }
        }

        var rootProgram: Program?
        for program in programs {
            if carriedBy[program.name] == nil {
                rootProgram = program
                break
            }
        }

        let root = createTree(at: rootProgram!, programs: byName)
        return root
    }

    private func createTree(at root: Program, programs: [String: Program]) -> Node {
        let node = Node(root)
        for name in root.carrying {
            let program = programs[name]!
            let child = createTree(at: program, programs: programs)
            node.add(child)
        }
        return node
    }
}
