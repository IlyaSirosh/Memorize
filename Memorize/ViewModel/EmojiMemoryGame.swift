//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Illya Sirosh on 18.01.2021.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var gameModel: MemoryGame<String>

    private static func createMemoryGame(_ numberOfPairsOfCards: Int) -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "😇", "💩", "😍", "😭", "😱", "👽"]
        
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { index in
            return emojis[index]
        }
    }
    
    init(numberOfPairsOfCards: Int){
        self.gameModel = EmojiMemoryGame.createMemoryGame(numberOfPairsOfCards)
    }

    
    //MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] {
        gameModel.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        gameModel.choose(card: card)
    }
}
