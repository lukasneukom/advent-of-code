//
//  File.swift
//  
//
//  Created by Lukas Neukom on 01.12.2023.
//

@_exported import AdventOfCodeCore

final class AdventOfCode2023 {
    let day: any AOCDay
    let input: String?
    
    init(day: any AOCDay , input: String?) {
        self.day = day
        self.input = input
    }
}
