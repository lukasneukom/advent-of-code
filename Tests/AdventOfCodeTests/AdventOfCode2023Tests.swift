//
//  AdventOfCode2023Tests.swift
//
//
//  Created by Lukas Neukom on 29.11.2023.
//

import XCTest
@testable import AdventOfCode2023

final class AdventOfCode2023Tests: XCTestCase {
    func testDay1() throws {
        let d = Day1(puzzleInput: "1abc2").solvePart1()
        XCTAssertEqual(d, "12")
    }
    
    func testDay2() throws {
        let d = Day2(puzzleInput: """
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
""").solvePart1()
        XCTAssertEqual(d, "8")
    }
}
