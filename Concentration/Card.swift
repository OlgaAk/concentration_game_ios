//
//  Card.swift
//  Concentration
//
//  Created by Olga Aktas on 01.12.2020.
//

import Foundation

struct Card: Hashable, Equatable {

    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var idFactory = 0
    
    private static func getUniqueId() -> Int {
        idFactory+=1
        return idFactory
    }
    
    init() {
        self.identifier = Card.getUniqueId()
    }
}
