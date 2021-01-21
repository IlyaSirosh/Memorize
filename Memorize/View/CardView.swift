//
//  ContentView.swift
//  Memorize
//
//  Created by Illya Sirosh on 18.01.2021.
//

import SwiftUI

struct CardView: View {
    var card: MemoryGame<Emoji>.Card
    
    var body: some View {
        GeometryReader { geomegry in
            self.body(for: geomegry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: Const.cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: Const.cornerRadius)
                    .stroke(lineWidth: Const.borderWidth)
                Text(card.content)
                    .font(.system(size:fontSize(for: size)))
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: Const.cornerRadius)
                        .fill()
                }
            }
        }
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
         min(size.height, size.width) * Const.fontScaleFactor
    }
    
    struct Const {
        static let cornerRadius: CGFloat = 15
        static let borderWidth: CGFloat = 3
        static let fontScaleFactor: CGFloat = 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: .init(id: 0, content: "😅", isFaceUp: true))
            .preferredColorScheme(.dark)
    }
}

