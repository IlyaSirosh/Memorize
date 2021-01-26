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
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if !card.isMatched {
            ZStack{
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90), clockwise: true)
                    .padding(Const.circlePadding)
                    .opacity(Const.circleOpacity)
                Text(card.content)
                    .font(.system(size:fontSize(for: size)))
                
            }.cardify(isFaceUp: card.isFaceUp)
        }
    
}
    
    private func fontSize(for size: CGSize) -> CGFloat {
         min(size.height, size.width) * Const.fontScaleFactor
    }
    
    struct Const {
        static let fontScaleFactor: CGFloat = 0.75
        static let circleOpacity: Double = 0.4
        static let circlePadding: CGFloat = 5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: .init(id: 0, content: "😅", isFaceUp: true))
            .foregroundColor(.orange)
            .preferredColorScheme(.dark)
    }
}

