//
//  Concentration.swift
//  Concentration
//
//  Created by Olga Aktas on 01.12.2020.
//

import Foundation

class Concentration {
    private(set) var cards = Array<Card>()
    
    private var indexOfOneAndOnlyOneFaceUp : Int? {
        get {
            var foundIndex : Int?
            for index in cards.indices{
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    var gameWin = false
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at \(index): chosen index not in cards")
        // if one card is already face up check if new card matches
        if indexOfOneAndOnlyOneFaceUp != nil {
            if cards[index].identifire == cards[indexOfOneAndOnlyOneFaceUp!].identifire {
                cards[index].isMatched = true
                cards[indexOfOneAndOnlyOneFaceUp!].isMatched = true
                var countNotMatched = 0
                for card in cards{
                    if !card.isMatched{
                        countNotMatched += 1
                    }
                }
                if countNotMatched == 0 {
                    gameWin = true
                }
            }
            cards[index].isFaceUp  = true
        } else {
            // if two o zero cards face up
            indexOfOneAndOnlyOneFaceUp = index
        }
    }
    
    
    init(numberOfCardPairs: Int) {
        for _ in 0..<numberOfCardPairs{
            let card = Card()
            cards += [card, card]
        }
    }
}
