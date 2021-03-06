//
//  Concentration.swift
//  Concentration
//
//  Created by Olga Aktas on 01.12.2020.
//

import Foundation

struct Concentration {
    private(set) var cards = Array<Card>()
    
    private var indexOfOneAndOnlyOneFaceUp : Int? {
        get {
            return cards.indices.filter {cards[$0].isFaceUp}.oneAndOnly
        }
        set {
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    var gameWin = false
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at \(index): chosen index not in cards")
        // if one card is already face up check if new card matches
        if indexOfOneAndOnlyOneFaceUp != nil {
            if cards[index] == cards[indexOfOneAndOnlyOneFaceUp!] {
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
        assert(numberOfCardPairs>0, "Concentration.init( \(numberOfCardPairs): you must have at least one pair of cards")
        for _ in 0..<numberOfCardPairs{
            let card = Card()
            cards += [card, card]
        }
    }
}


extension Collection {
    var oneAndOnly : Element? {
        return count == 1 ? first : nil
    }
}
