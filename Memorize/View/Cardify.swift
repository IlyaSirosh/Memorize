//
//  Cardify.swift
//  Memorize
//
//  Created by Illya Sirosh on 26.01.2021.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool) {
        self.rotation = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: Const.cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: Const.cornerRadius)
                    .stroke(lineWidth: Const.borderWidth)
                content
            }.opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: Const.cornerRadius)
                .fill()
                .opacity(isFaceUp ? 0 : 1)
        }.rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    struct Const {
        static let cornerRadius: CGFloat = 15
        static let borderWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}


