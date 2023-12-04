//
//  File.swift
//  
//
//  Created by Lukas Neukom on 01.12.2023.
//

import Foundation
import AdventOfCode2023

let inputFileURL = Bundle.module.url(forResource: "inputs/2023/input4", withExtension: "")
let rawInput = try String(contentsOf: inputFileURL!).trimmingCharacters(in: .whitespacesAndNewlines)

let d = Day4(puzzleInput: rawInput).solvePart1()
print(d)
