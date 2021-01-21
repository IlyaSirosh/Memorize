//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Illya Sirosh on 18.01.2021.
//

import Foundation

typealias Emoji = String

class EmojiMemoryGame: ObservableObject {
    let theme: GameTheme<Emoji>
    @Published private var gameModel: MemoryGame<Emoji>

    private static func createMemoryGame(_ numberOfPairsOfCards: Int) -> MemoryGame<Emoji> {
        var emojis = ["👻", "🎃", "😇", "💩", "😍", "😭", "😱", "👽", "🥳", "🐼", "🐸", "🍒", "🍏", "🍐"]
        
        // shuffle emojis to allow more random emojis set appear in each game
        emojis.shuffle()
        
        return MemoryGame<Emoji>(numberOfPairsOfCards: numberOfPairsOfCards) { index in
            return emojis[index]
        }
    }
    
    init(theme: GameTheme<Emoji>){
        self.theme = theme
        self.gameModel = MemoryGame<Emoji>(numberOfPairsOfCards: theme.numberOfCards, cardContentFactory: theme.contentFactory)
    }

    
    //MARK: - Access to the Model
    
    var cards: [MemoryGame<Emoji>.Card] {
        gameModel.cards
    }
    
    var score: Int {
        gameModel.score
    }
    
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<Emoji>.Card){
        gameModel.choose(card: card)
    }
    
}
