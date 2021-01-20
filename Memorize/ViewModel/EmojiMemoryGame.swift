//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Illya Sirosh on 18.01.2021.
//

import Foundation

typealias Emoji = String

class EmojiMemoryGame: ObservableObject {
    @Published private var gameModel: MemoryGame<Emoji>

    private static func createMemoryGame(_ numberOfPairsOfCards: Int) -> MemoryGame<Emoji> {
        var emojis = ["👻", "🎃", "😇", "💩", "😍", "😭", "😱", "👽", "🥳", "🐼", "🐸", "🍒", "🍏", "🍐"]
        
        // shuffle emojis to allow more random emojis set appear in each game
        emojis.shuffle()
        
        return MemoryGame<Emoji>(numberOfPairsOfCards: numberOfPairsOfCards) { index in
            return emojis[index]
        }
    }
    
    init(numberOfPairsOfCards: Int){
        self.gameModel = EmojiMemoryGame.createMemoryGame(numberOfPairsOfCards)
    }

    
    //MARK: - Access to the Model
    
    var cards: [MemoryGame<Emoji>.Card] {
        gameModel.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<Emoji>.Card){
        gameModel.choose(card: card)
    }
}
