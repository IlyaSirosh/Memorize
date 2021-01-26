//
//  Cardify.swift
//  Memorize
//
//  Created by Illya Sirosh on 26.01.2021.
//

import SwiftUI

struct MyCardify: ViewModifier {
    
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: Const.cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: Const.cornerRadius)
                    .stroke(lineWidth: Const.borderWidth)
                content
            }  else {
                RoundedRectangle(cornerRadius: Const.cornerRadius)
                    .fill()
            }
        }
    }
    
    struct Const {
        static let cornerRadius: CGFloat = 15
        static let borderWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(MyCardify(isFaceUp: isFaceUp))
    }
}
