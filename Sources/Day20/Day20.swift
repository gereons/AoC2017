//
// Advent of Code 2017
//
// https://adventofcode.com/2017/day/20
//

import AoCTools
import Foundation

struct Particle {
    let id: Int
    var position: Point3
    var velocity: Point3
    let acceleration: Point3

    // p=<-717,-4557,2578>, v=<153,21,30>, a=<-8,8,-7>
    private static let pattern = #"p=<(-?\d*),(-?\d*),(-?\d*)>, v=<(-?\d*),(-?\d*),(-?\d*)>, a=<(-?\d*),(-?\d*),(-?\d*)>"#
    private static let regex = try! NSRegularExpression(pattern: pattern)

    init(id: Int, _ string: String) {
        self.id = id
        let range = NSRange(location: 0, length: string.count)
        let matches = Self.regex.matches(in: string, options: [], range: range)

        let match = matches.last!

        self.position = Point3(
            Int(String(string[Range(match.range(at: 1), in: string)!]))!,
            Int(String(string[Range(match.range(at: 2), in: string)!]))!,
            Int(String(string[Range(match.range(at: 3), in: string)!]))!)
        self.velocity = Point3(
            Int(String(string[Range(match.range(at: 4), in: string)!]))!,
            Int(String(string[Range(match.range(at: 5), in: string)!]))!,
            Int(String(string[Range(match.range(at: 6), in: string)!]))!)
        self.acceleration = Point3(
            Int(String(string[Range(match.range(at: 7), in: string)!]))!,
            Int(String(string[Range(match.range(at: 8), in: string)!]))!,
            Int(String(string[Range(match.range(at: 9), in: string)!]))!)
    }

    mutating func move() {
        velocity = velocity + acceleration
        position = position + velocity
    }
}

final class Day20: AOCDay {
    let particles: [Particle]
    init(input: String? = nil) {
        let input = input ?? Self.input
        particles = input.components(separatedBy: "\n").enumerated().map { Particle(id: $0, $1) }
    }

    func part1() -> Int {
        var particles = particles
        while true {
            var movingTowards0 = 0

            for index in particles.indices {
                let distance = particles[index].position.distance()
                particles[index].move()
                let newDistance = particles[index].position.distance()
                if newDistance < distance {
                    movingTowards0 += 1
                }
            }

            if movingTowards0 == 0 {
                break
            }
        }

        for _ in 0...1000 {
            for index in particles.indices {
                particles[index].move()
            }
        }
        let byDistance = particles.sorted { $0.position.distance() < $1.position.distance() }
        return byDistance.first!.id
    }

    func part2() -> Int {
        var particles = particles
        var count = 0
        while count < 1_000 {
            var removed = false
            for index in particles.indices {
                particles[index].move()
            }
            var positions = [Point3: Set<Int>]()
            for p in particles {
                positions[p.position, default: []].insert(p.id)
            }
            for p in positions.values {
                if p.count > 1 {
                    particles.removeAll { p.contains($0.id) }
                    removed = true
                }
            }

            if removed {
                count = 0
            } else {
                count += 1
            }
        }

        return particles.count
    }
}
