//
//  AdventOfCode2015Tests.swift
//
//
//  Created by Lukas Neukom on 29.11.2023.
//

import XCTest
@testable import AdventOfCode2015

final class AdventOfCode2015Tests: XCTestCase {
    func testDay01() throws {
        let d1 = Day01(puzzleInput: "(())").solvePart1()
        XCTAssertEqual(d1, "0")
        
        let d2 = Day01(puzzleInput: "()()").solvePart1()
        XCTAssertEqual(d2, "0")
    }
}
