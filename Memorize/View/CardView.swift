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
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 15)
                    .fill()
            }
        }.foregroundColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: .init(id: 0, content: "😅"))
            .preferredColorScheme(.dark)
    }
}

