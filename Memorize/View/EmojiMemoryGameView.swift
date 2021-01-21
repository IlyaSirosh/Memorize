//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Illya Sirosh on 18.01.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var gameViewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack{
                Text(gameViewModel.theme.name)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Text("Score: \(gameViewModel.score)")
                    .fontWeight(.semibold)
                    .font(.title2)
            }.padding()
            Grid(gameViewModel.cards){ card in
                CardView(card: card)
                    .onTapGesture {
                        gameViewModel.choose(card: card)
                    }
                    .aspectRatio(Const.cardRatio, contentMode: .fit)
                    .padding()
                    .foregroundColor(gameViewModel.theme.color)
            }
        }
    }
    
    struct Const {
        static let cardRatio: CGFloat = 2/3
    }
}

struct CardGrid_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(gameViewModel: EmojiMemoryGame(theme: EmojiThemeFactory.helloween))
    }
}
