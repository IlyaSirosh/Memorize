//
//  MemoryGame.swift
//  Memorize
//
//  Created by Illya Sirosh on 18.01.2021.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card]
    private(set) var score = 0
    private var indecesOfSeenCards = [Int]()
    private var indexOfFaceUpCard: Int?
    {
        set{
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
        get {
            let faceUpCardIndecies = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCardIndecies.only
        }
    }
    
    
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
        guard let cardIndex = cards.firstIndex(of: card), !cards[cardIndex].isFaceUp && !cards[cardIndex].isMatched else {return}
        
        if let potentialMatchCardIndex = indexOfFaceUpCard {
            if cards[potentialMatchCardIndex].content == cards[cardIndex].content {
                cards[potentialMatchCardIndex].isMatched = true
                cards[cardIndex].isMatched = true
                scoreUp()
            } else {
                scoreDown(cardIndex: cardIndex)
                scoreDown(cardIndex: potentialMatchCardIndex)
            }
            cards[cardIndex].isFaceUp = true
        } else {
            indexOfFaceUpCard = cardIndex
        }
    }
    
    private mutating func scoreUp(){
        score += 2
    }
    
    private mutating func scoreDown(cardIndex: Int){
        if indecesOfSeenCards.contains(cardIndex) {
            score -= 1
        } else {
            indecesOfSeenCards.append(cardIndex)
        }
    }
    
    
    struct Card: Identifiable{
        let id: Int
        let content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
}
