// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Advent of Code",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "AdventOfCode", targets: ["AdventOfCode"]),
        .executable(name: "AdventOfCodeCLI", targets: ["AdventOfCodeCLI"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(name: "AdventOfCodeCLI", dependencies: ["AdventOfCode"], resources: [.copy("inputs")]),
        
        .target(name: "AdventOfCode", dependencies: ["AdventOfCodeCore", "AdventOfCode2023", "AdventOfCode2015"]),
        .target(name: "AdventOfCode2023", dependencies: ["AdventOfCodeCore"]),
        .target(name: "AdventOfCode2015", dependencies: ["AdventOfCodeCore"]),
        .target(name: "AdventOfCodeCore"),
        
        .testTarget(name: "AdventOfCodeTests", dependencies: ["AdventOfCode"]),
    ]
)
