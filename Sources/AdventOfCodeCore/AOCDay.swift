//
//  AOCDay.swift
//
//
//  Created by Lukas Neukom on 29.11.2023.
//

public protocol AOCDay {
    var puzzleInput: String? { get }
    
    func solve() -> (String, String)
    func solvePart1() -> String
    func solvePart2() -> String
}

extension AOCDay {
    public func solve() -> (String, String) {
        return (solvePart1(), solvePart2())
    }
    
    public func solvePart1() -> String {
        print("Solution not implemented")
        return ""
    }
    
    public func solvePart2() -> String {
        print("No solution implemented")
        return ""
    }
}
