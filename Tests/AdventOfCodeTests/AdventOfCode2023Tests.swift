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
    
    func testDay3() throws {
        let input = """
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
"""
        let day = Day3(puzzleInput: input)
        let d = day.solvePart1()
        let e = day.solvePart2()
        XCTAssertEqual(d, "4361")
        XCTAssertEqual(e, "467835")
    }
    
    func testDay() throws {
        let input = """
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
"""
        let d = Day4(puzzleInput: input).solvePart1()
        XCTAssertEqual(d, "13")
    }
}
