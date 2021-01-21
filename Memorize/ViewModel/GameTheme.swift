//
//  EmojiMemoryGameTheme.swift
//  Memorize
//
//  Created by Illya Sirosh on 21.01.2021.
//

import Foundation
import SwiftUI

struct GameTheme<Content> {
    let name: String
    let color: Color
    let contentSet: [Content]
    let numberOfCards: Int
    
    let contentFactory: (Int) -> Content
    
    init(name: String, color: Color, numberOfCards: Int, contentSet: [Content]) {
        self.name = name
        self.color = color
        self.numberOfCards = numberOfCards
        self.contentSet = contentSet
        let availableSet = contentSet.shuffled()
        
        self.contentFactory = { index in availableSet[index] }
    }

}
