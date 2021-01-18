//
//  CardGrid.swift
//  Memorize
//
//  Created by Illya Sirosh on 18.01.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var gameViewModel: EmojiMemoryGame
    
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(gameViewModel.cards){ card in
                CardView(card: card)
                    .onTapGesture {
                        gameViewModel.choose(card: card)
                    }
                    .aspectRatio(2/3, contentMode: .fit)
            }.font(gameViewModel.cards.count < 10 ? .largeTitle : .body)
        }.padding()
    }
}

struct CardGrid_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(gameViewModel: EmojiMemoryGame(numberOfPairsOfCards: 5))
    }
}