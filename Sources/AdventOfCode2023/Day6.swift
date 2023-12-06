//
//  File.swift
//  
//
//  Created by Lukas Neukom on 06.12.2023.
//

import Foundation
import AdventOfCodeCore

public class Day6: AOCDay {
    public let puzzleInput: String?
    
    public init(puzzleInput input: String?) {
        puzzleInput = input ?? ""
    }
    
    public func solvePart1() -> String {
        let input = puzzleInput!.components(separatedBy: .newlines)
        let times = input[0].split(separator: " ").dropFirst()
        let distances = input[1].split(separator: " ").dropFirst()
        
        var records = [Int: Int]()
        
        for i in 1...times.count {
            records[Int(times[i])!] = Int(distances[i])!
        }
        
        var multipleOfWinningWays = 1
        
        for (time, distance) in records {
            var winningWays = 0
            
            for v in 0...time {
                let possibleDistance = v * (time - v)
                if possibleDistance > distance {
                    winningWays += 1
                }
            }
            multipleOfWinningWays *= winningWays
        }
        
        return "\(multipleOfWinningWays)"
    }
    
    public func solvePart2() -> String {
        let input = puzzleInput!.components(separatedBy: .newlines)
        let time = Double(input[0].filter( { $0.isWholeNumber } ))!
        let distance = Double(input[1].filter( { $0.isWholeNumber } ))!
        
//  distance = v * (time - v)
//  v^2 + (-t)*v + d = 0

//  v = (t +- sqrt(t^2 + 4*d)) / 2
        
        let sr = (time*time - 4*distance).squareRoot()
        
        let v1 = Int(((time + sr) / 2).rounded(.down))
        let v2 = Int(((time - sr) / 2).rounded(.up))
        
        print(time)
        print(distance)
        print("\(v1) to \(v2)")
        
        return "\(v1-v2+1)"
    }
}
