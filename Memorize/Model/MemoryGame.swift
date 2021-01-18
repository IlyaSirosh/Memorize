//
//  MemoryGame.swift
//  Memorize
//
//  Created by Illya Sirosh on 18.01.2021.
//

import Foundation

struct MemoryGame<CardContent: Hashable> {
    var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        self.cards = [Card]()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            self.cards.append(Card(id: 2*pairIndex    , content: content))
            self.cards.append(Card(id: 2*pairIndex + 1, content: content))
        }
        
        self.cards.shuffle()
    }
    
    mutating func choose(card: Card){
        guard let cardIndex = getIndex(of: card) else { return }
        
        var storedCard = cards[cardIndex]
        storedCard.isFaceUp.toggle()
        cards[cardIndex] = storedCard

    }
    
    private func getIndex(of card: Card) -> Int? {
        cards.firstIndex (where: { (storedCard) -> Bool in
            card.id == storedCard.id
        })
    }
    
    struct Card: Identifiable{
        let id: Int
        let content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
}
