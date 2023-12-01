//
//  File.swift
//  
//
//  Created by Lukas Neukom on 29.11.2023.
//

import Foundation
import AdventOfCodeCore

public class Day1: AOCDay {
    public let puzzleInput: String?
    
    public init(puzzleInput input: String?) {
        puzzleInput = input ?? ""
    }
    
    public func solvePart1() -> String {
        let lines = puzzleInput!.components(separatedBy: .newlines)
        var sumOfCalibrationValues = 0
        
        for line in lines {
            let firstDigit = line.first(where: { $0.isNumber })?.wholeNumberValue ?? 0
            let lastDigit = line.last(where: { $0.isNumber })?.wholeNumberValue ?? 0
            let calibrationValue = firstDigit * 10 + lastDigit
            sumOfCalibrationValues += calibrationValue
        }
        
        return "\(sumOfCalibrationValues)"
    }
    
    public func solvePart2() -> String {
        let lines = puzzleInput!.components(separatedBy: .newlines)
        var sumOfCalibrationValues = 0
        
        let spelledOutDigits: Set = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

        let nameOfDigit = [
            "zero": 0,
            "one": 1,
            "two": 2,
            "three": 3,
            "four": 4,
            "five": 5,
            "six": 6,
            "seven": 7,
            "eight": 8,
            "nine": 9
        ]
        
        for line in lines {
            var firstDigit = -1
            var l = line
            
            while firstDigit < 0 {
                for d in spelledOutDigits {
                    if l.hasPrefix(d) {
                        let firstDigitString = d
                        if firstDigitString.count == 1 {
                            firstDigit = firstDigitString.first?.wholeNumberValue ?? 0
                        } else {
                            firstDigit = nameOfDigit[firstDigitString]!
                        }
                    }
                }
                l = String(l.dropFirst())
            }
            
            var lastDigit = -1
            l = line
            
            while lastDigit < 0 {
                for d in spelledOutDigits {
                    if l.hasSuffix(d) {
                        let lastDigitString = d
                        if lastDigitString.count == 1 {
                            lastDigit = lastDigitString.first?.wholeNumberValue ?? 0
                        } else {
                            lastDigit = nameOfDigit[lastDigitString]!
                        }
                    }
                }
                l = String(l.dropLast())
            }
            
            let calibrationValue = firstDigit * 10 + lastDigit
            sumOfCalibrationValues += calibrationValue
        }
        return "\(sumOfCalibrationValues)"
    }
}
