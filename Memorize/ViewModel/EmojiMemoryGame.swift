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
