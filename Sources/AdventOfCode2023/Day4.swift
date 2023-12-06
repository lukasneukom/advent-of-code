//
//  File.swift
//  
//
//  Created by Lukas Neukom on 04.12.2023.
//

import AdventOfCodeCore

public class Day4: AOCDay {
    public let puzzleInput: String?
    
    public init(puzzleInput input: String?) {
        puzzleInput = input ?? ""
    }

    public func solvePart1() -> String {
        let cards = puzzleInput!.components(separatedBy: .newlines)
        
        var sumOfPoints = 0
        var scratchcards = [Int: Int]()
        var sumOfCards = 0
        
        for i in 0..<cards.count {
            scratchcards[i] = 1
        }
        print(scratchcards)
        
        var cardCount = 0
        
        for card in cards {
            print("reading card \(cardCount)")
            let numbers = card.components(separatedBy: ":")
            let numberLists = numbers[1].components(separatedBy: " | ")
            let winning = numberLists[0].components(separatedBy: .whitespaces)
            let chosen = numberLists[1].components(separatedBy: .whitespaces)
            
            var winningNumbers = Set<Int>()
            var points = 0
            var matches = 0
            let ownCards = scratchcards[cardCount]!
            
            for winner in winning {
                if winner != "" {
                    winningNumbers.insert(Int(winner)!)
                }
            }
            
            for choice in chosen {
                if choice != "" {
                    if winningNumbers.contains(Int(choice)!) {
                        matches += 1
                        if points == 0 {
                            points = 1
                        } else {
                            points *= 2
                        }
                    }
                }
            }
            
            sumOfPoints += points
            
            if points > 0 {
                print("owning \(ownCards), adding to next \(matches)")
                for i in 1...matches {
                    let newV = scratchcards[cardCount+i]! + 1*ownCards
                    scratchcards[cardCount+i] = newV
                }
            }
            print(scratchcards)
            cardCount += 1
        }
        
        for (_, amount) in scratchcards {
            sumOfCards += amount
        }
        
        print(sumOfPoints)
        print(sumOfCards)
        print("")
        
        return "\(sumOfPoints)"
    }
}
