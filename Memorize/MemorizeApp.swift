//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Illya Sirosh on 18.01.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @State var game = EmojiMemoryGame(theme: EmojiThemeFactory.randomTheme)
    
    var body: some Scene {
        WindowGroup {
            VStack {
                EmojiMemoryGameView(gameViewModel: game)
                Button("New Game") {
                    game = EmojiMemoryGame(theme: EmojiThemeFactory.randomTheme)
                }
            }
            
        }
    }
}
