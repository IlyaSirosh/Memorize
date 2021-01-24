//
//  ThemeFactory.swift
//  Memorize
//
//  Created by Illya Sirosh on 21.01.2021.
//

import Foundation

struct EmojiThemeFactory {
    static var helloween: GameTheme<Emoji> {
        let content: [Emoji] = ["🎃", "👻", "🥧", "🍬", "🧟‍♂️", "👽", "🧟‍♀️", "🧛🏻‍♂️"]
    
        return GameTheme(name: "Helloween", color: .orange, numberOfCards: 3, contentSet: content)
    }
    
    static var emotions: GameTheme<Emoji> {
        let content: [Emoji] = ["😃", "😇", "😍", "🥳", "😎", "😱", "😤", "😷"]
    
        return GameTheme(name: "Emotions", color: .yellow, numberOfCards: 3, contentSet: content)
    }
    
    static var flags: GameTheme<Emoji> {
        let content: [Emoji] = ["🏴‍☠️", "🏳️", "🇺🇳", "🇺🇸", "🇺🇦", "🇨🇦", "🇬🇧", "🇯🇵", "🇮🇹", "🇩🇪", "🇫🇷", "🇵🇱", "🇨🇿"]
    
        return GameTheme(name: "Flags", color: .blue, numberOfCards: 6, contentSet: content)
    }
    
    static var fruits: GameTheme<Emoji> {
        let content: [Emoji] = ["🍓", "🍉", "🍐", "🍊", "🍇", "🥑", "🍅", "🍎", "🍋", "🍒", "🍍", "🥝", "🍑", "🥭"]
    
        return GameTheme(name: "Fruits", color: .red, numberOfCards: 6, contentSet: content)
    }
    
    static var activity: GameTheme<Emoji> {
        let content: [Emoji] = ["⚽️", "🏀", "🏈", "🎱", "🏓", "🥏", "⚾️", "🥎", "⛸", "🛷", "🥊", "🎣", "🤿", "🏸", "🏂", "🪂"]
        let numberOfCards = [3, 6, 10].randomElement()!
        
        return GameTheme(name: "Activity", color: .blue, numberOfCards: numberOfCards, contentSet: content)
    }
    
    static var animals: GameTheme<Emoji> {
        let content: [Emoji] = ["🐶", "🐭", "🐹", "🦊", "🐰", "🐼", "🐻", "🐸", "🐮", "🐱", "🐵", "🐷", "🐔", "🐴", "🐝"]
        let numberOfCards = [3, 6, 10].randomElement()!
    
        return GameTheme(name: "Animals", color: .orange, numberOfCards: numberOfCards, contentSet: content)
    }
    
    static let themes: [GameTheme<Emoji>] = [helloween, emotions, flags, fruits, activity, animals]
    
    static var randomTheme: GameTheme<Emoji> {
        themes.randomElement()!
    }
}
 
