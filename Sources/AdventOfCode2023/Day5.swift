//
//  File.swift
//  
//
//  Created by Lukas Neukom on 05.12.2023.
//

import AdventOfCodeCore

public class Day5: AOCDay {
    public let puzzleInput: String?
    
    public init(puzzleInput input: String?) {
        puzzleInput = input ?? ""
    }
    
    public func solvePart1() -> String {
        let instructions = puzzleInput!.components(separatedBy: "\n\n")
        let seeds = instructions[0].components(separatedBy: " ").dropFirst()
        let maps = instructions.dropFirst()
        
        var locations = [Int]()
        
        for seed in seeds {
            var s = Int(seed)!
            for map in maps {
                s = findDestinationFor(s, with: map)
            }
            locations.append(s)
        }
        
        let smallestLocation = locations.min()!
        
        return "\(smallestLocation)"
    }
    
    public func solvePart2() -> String {
        let instructions = puzzleInput!.components(separatedBy: "\n\n")
        let seedRanges = instructions[0].components(separatedBy: " ").dropFirst()
        let maps = instructions.dropFirst()
        
        var smallestLocation = 999999999999
        
        for r in 1...seedRanges.count/2+1 {
            print("checking range")
            if r%2 == 0 { continue }
            for s in (Int(seedRanges[r])!..<Int(seedRanges[r])!+Int(seedRanges[r+1])!) {
                var ss = s
                for map in maps {
                    ss = findDestinationFor(ss, with: map)
                }
                if ss < smallestLocation {
                    smallestLocation = ss
                    print("smallest so far is \(smallestLocation)")
                }
            }
        }
        
        return "\(smallestLocation)"
    }
    
    func findDestinationFor(_ seed: Int, with map: String) -> Int {
        let mappings = map.components(separatedBy: "\n").dropFirst()
        for mapping in mappings {
            let m = mapping.components(separatedBy: " ")
            let destinationRangeStart = Int(m[0])!
            let sourceRangeStart = Int(m[1])!
            let rangeLength = Int(m[2])!
            
            if (sourceRangeStart..<sourceRangeStart+rangeLength).contains(seed) {
                return seed + (destinationRangeStart - sourceRangeStart)
            }
        }
        return seed
    }
}
