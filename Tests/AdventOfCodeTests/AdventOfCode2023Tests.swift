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
        
    }
}
