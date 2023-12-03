//
//  File.swift
//
//
//  Created by Lukas Neukom on 03.12.2023.
//

import AdventOfCodeCore

public class Day3: AOCDay {
    public let puzzleInput: String?
    
    var schematic = [[Character]]()
    var gears = [String: [Int]]()
    
    public init(puzzleInput input: String?) {
        puzzleInput = input ?? ""
    }
    
    public func solvePart1() -> String {
        for row in puzzleInput!.components(separatedBy: .newlines) {
            schematic.append(row.map({ $0 }))
        }
        
        let schematicHeight = schematic.count
        let schematicWidth = schematic[0].count
        
        var sumOfPartNumbers = 0
        
        for y in 0..<schematicHeight {
            var skipX = 0
            
            for x in 0..<schematicWidth {
                if skipX > 0 {
                    skipX -= 1
                    continue
                }
                
                var isAdjacent = false
                var partNumber = ""
                
                // find whole number
                if schematic[y][x].isWholeNumber {
                    var endOfNumber = x+1
                    while endOfNumber < schematicWidth {
                        if schematic[y][endOfNumber].isWholeNumber {
                            endOfNumber += 1
                        } else { break }
                    }
                    for i in x..<endOfNumber {
                        partNumber.append(schematic[y][i])
                    }
                    
                    skipX = endOfNumber - x - 1
                }
                
                if partNumber.count == 0 {
                    continue
                }
                
                // check adjacency
                // above
                //                print("\nFound \(partNumber), checking adjacency")
                //                print("above, left and right")
                if y > 0 {
                    for i in 0..<partNumber.count {
                        if check(schematic[y-1][x+i]) {
                            isAdjacent = true
                        }
                        if schematic[y-1][x+i] == "*" {
                            addGear(x: x+i, y: y-1, partNumber: Int(partNumber)!)
                        }
                        
                    }
                    // above and left
                    if x > 0 {
                        if check(schematic[y-1][x-1]) {
                            isAdjacent = true
                        }
                        if schematic[y-1][x-1] == "*" {
                            addGear(x: x-1, y: y-1, partNumber: Int(partNumber)!)
                        }
                        
                    }
                    // above and right
                    if x + partNumber.count < schematicWidth {
                        if check(schematic[y-1][x+partNumber.count]) {
                            isAdjacent = true
                        }
                        if schematic[y-1][x+partNumber.count] == "*" {
                            addGear(x: x+partNumber.count, y: y-1, partNumber: Int(partNumber)!)
                        }
                    }
                }
                
                // left and right
                //                print("left-right")
                if x > 0 {
                    if check(schematic[y][x-1]) {
                        isAdjacent = true
                    }
                    if schematic[y][x-1] == "*" {
                        addGear(x: x-1, y: y, partNumber: Int(partNumber)!)
                    }
                }
                if x + partNumber.count < schematicWidth {
                    if check(schematic[y][x+partNumber.count]) {
                        isAdjacent = true
                    }
                    if schematic[y][x+partNumber.count] == "*" {
                        addGear(x: x+partNumber.count, y: y, partNumber: Int(partNumber)!)
                    }
                }
                
                // under
                //                print("under, left and right")
                if y < schematicHeight - 1 {
                    for i in 0..<partNumber.count {
                        if check(schematic[y+1][x+i]) {
                            isAdjacent = true
                        }
                        if schematic[y+1][x+i] == "*" {
                            addGear(x: x+i, y: y+1, partNumber: Int(partNumber)!)
                        }
                    }
                    // under and left
                    if x > 0 {
                        if check(schematic[y+1][x-1]) {
                            isAdjacent = true
                        }
                        if schematic[y+1][x-1] == "*" {
                            addGear(x: x-1, y: y+1, partNumber: Int(partNumber)!)
                        }
                    }
                    // under and right
                    if x + partNumber.count < schematicWidth {
                        if check(schematic[y+1][x+partNumber.count]) {
                            isAdjacent = true
                        }
                        if schematic[y+1][x+partNumber.count] == "*" {
                            addGear(x: x+partNumber.count, y: y+1, partNumber: Int(partNumber)!)
                        }
                    }
                }
                if isAdjacent {
                    //                    print("adding \(partNumber)")
                    sumOfPartNumbers += Int(partNumber)!
                }
            }
        }
        
        return "\(sumOfPartNumbers)"
    }
    
    func check(_ c: Character) -> Bool {
        //        print("Checking Character: \(c)")
        return !c.isWholeNumber && c != "."
    }
    
    func addGear(x: Int, y: Int, partNumber: Int) {
        if gears["\(x),\(y)"] == nil {
            gears["\(x),\(y)"] = [partNumber]
        } else {
            var n = gears["\(x),\(y)"]!
            n.append(partNumber)
            gears["\(x),\(y)"] = n
        }
    }
    
    public func solvePart2() -> String {
        var sumOfGearRatios = 0
        print(gears)
        
        for (_, gear) in gears {
            if gear.count == 2 {
                sumOfGearRatios += gear[0]*gear[1]
            }
        }
        
        return "\(sumOfGearRatios)"
    }
}
