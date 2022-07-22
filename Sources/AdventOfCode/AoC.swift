//
// Advent of Code 2017
//

import AoCTools

@main
struct AdventOfCode {
    static func main() {
//        Day01().run()
//        Day02().run()
//        Day03().run()
//        Day04().run()
//        Day05().run()
//        Day06().run()
//        Day07().run()
//        Day08().run()
//        Day09().run()
//        Day10().run()
//        Day11().run()
//        Day12().run()
//        Day13().run()
//        Day14().run()
//        Day15().run()
//        Day16().run()
        Day17().run()
//        Day18().run()
//        Day19().run()
//        Day20().run()
//        Day21().run()
//        Day22().run()
//        Day23().run()
//        Day24().run()
//        Day25().run()
        Timer.showTotal()
    }
}

protocol AOCDay {
    associatedtype Solution1
    associatedtype Solution2

    static var rawInput: String { get }

    init(rawInput: String?)
    func run()
    func part1() -> Solution1
    func part2() -> Solution2
    var day: String { get }
}

extension AOCDay {
    static var rawInput: String { "" }
    var day: String { String("\(Self.self)".suffix(2)) }

    func run() {
        run(part: 1, part1)
        run(part: 2, part2)
    }

    private func run<T>(part: Int, _ fun: () -> T) {
        let timer = Timer(day, fun: "part \(part)")
        let solution = fun()
        timer.show()
        print("Solution for day \(day) part \(part): \(solution)")
    }
}
