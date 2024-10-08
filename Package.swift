// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode",
    platforms: [
        .macOS(.v15)
    ],
    dependencies: [
        .package(url: "https://github.com/gereons/AoCTools", from: "0.1.0")
    ],
    targets: [
        .executableTarget(
            name: "AdventOfCode",
            dependencies: [
                "AoCTools"
            ],
            path: "Sources"),
        .testTarget(
            name: "aocTests",
            dependencies: [ "AdventOfCode", "AoCTools" ])
    ]
)
