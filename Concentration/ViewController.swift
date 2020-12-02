//
//  ViewController.swift
//  Concentration
//
//  Created by Olga Aktas on 01.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game : Concentration = Concentration(numberOfCardPairs: numberOfPairsOfCards)
    
    var numberOfPairsOfCards : Int {
        return (cardButtons.count+1)/2
    }
    
    private(set) var flipCount : Int = 0 {
        didSet {
            flipCountLable.text = game.gameWin ? "You WON!!" : "Count: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLable: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let cardButton = cardButtons[index]
            let card = game.cards[index]
            if !card.isFaceUp  {
                cardButton.setTitle("", for: UIControl.State.normal)
                cardButton.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            } else {
                cardButton.setTitle(emoji(for: card), for: UIControl.State.normal)
                cardButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                flipCount+=1
            }
        }
    }
    
    private var emojiChoises : [String] = ["👻", "🎃", "🐭", "🐤", "🐝", "🦄", "🐌"]
    
    private var emojiDictionary = [Int: String]()
    
    private func emoji(for card: Card) -> String {
        if emojiDictionary[card.identifire] == nil, emojiChoises.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoises.count)))
            emojiDictionary[card.identifire] = emojiChoises.remove(at: randomIndex )
        }
        return emojiDictionary[card.identifire] ?? "?"
    }

}

