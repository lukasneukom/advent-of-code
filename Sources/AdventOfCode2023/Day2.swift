//
//  File.swift
//  
//
//  Created by Lukas Neukom on 01.12.2023.
//

import AdventOfCodeCore

public class Day2: AOCDay {
    public let puzzleInput: String?
    
    public init(puzzleInput input: String?) {
        puzzleInput = input ?? ""
    }
    
    public func solvePart1() -> String {
        let gameRecords = puzzleInput!.components(separatedBy: .newlines)
        var sumOfPossibleRecordIDs = 0
        var sumOfSetPowers = 0
        
        for gameRecord in gameRecords {
            var allGamesPossible = true
            var minRedCubes = 0
            var minGreenCubes = 0
            var minBlueCubes = 0
            
            let recordComponents = gameRecord.components(separatedBy: ":")
            let gameID = Int(recordComponents[0].dropFirst(5))
            let games = recordComponents[1].components(separatedBy: ";")
            
            for game in games {
                var redCubes = 0
                var greenCubes = 0
                var blueCubes = 0
                
                print("Analyzing game \(game)")
                let revealedColors = game.components(separatedBy: ",")
                for revealedColor in revealedColors {
                    let revealedCubes = revealedColor.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
                    let color = revealedCubes[1]
                    let numberOfCubes = Int(revealedCubes[0])
                    print(revealedCubes)
                    
                    switch color {
                    case "red":
                        redCubes = numberOfCubes!
                        minRedCubes = redCubes > minRedCubes ? redCubes: minRedCubes
                    case "green":
                        greenCubes = numberOfCubes!
                        minGreenCubes = greenCubes > minGreenCubes ? greenCubes: minGreenCubes
                    case "blue":
                        blueCubes = numberOfCubes!
                        minBlueCubes = blueCubes > minBlueCubes ? blueCubes: minBlueCubes
                    default:
                        print("something went wrong")
                    }
                }
                
                if !(redCubes <= 12 && greenCubes <= 13 && blueCubes <= 14) {
                    allGamesPossible = false
                }
            }
            if allGamesPossible {
                sumOfPossibleRecordIDs += gameID!
            }
            sumOfSetPowers += minRedCubes * minGreenCubes * minBlueCubes
        }
        print("all Sets have a power of: \(sumOfSetPowers)")
        return "\(sumOfPossibleRecordIDs)"
    }
    
    public func solvePart2() -> String {
        return ""
    }
}
