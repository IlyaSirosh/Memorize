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
            Grid(gameViewModel.cards, itemRatio: Double(Const.cardRatio)){
                card in
                CardView(card: card)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            gameViewModel.choose(card: card)
                        }
                    }
                    .aspectRatio(Const.cardRatio, contentMode: .fit)
                    .foregroundColor(gameViewModel.theme.color)
                    .padding(5)
            }
            .padding()
            Button("New Game") {
                withAnimation(.easeInOut(duration: 1)) {
                    gameViewModel.resetGame()
                }
            }
        }
//        .navigationBarItems(trailing: Button("New Game", action: gameViewModel.resetGame) )
    }
    
    struct Const {
        static let cardRatio: CGFloat = 2/3
    }
}

struct CardGrid_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(theme: EmojiThemeFactory.helloween)
        game.choose(card: game.cards[1])
        return EmojiMemoryGameView(gameViewModel: game)
    }
}
