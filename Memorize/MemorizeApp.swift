//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Illya Sirosh on 18.01.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @State var game = EmojiMemoryGame(numberOfPairsOfCards: Int.random(in: 2...5)
    )
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(gameViewModel: game)
        }
    }
}
