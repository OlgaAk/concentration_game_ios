//
//  Card.swift
//  Concentration
//
//  Created by Olga Aktas on 01.12.2020.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifire: Int
    
    private static var idFactory = 0
    
    private static func getUniqueId() -> Int {
        idFactory+=1
        return idFactory
    }
    
    init() {
        self.identifire = Card.getUniqueId()
    }
}
