//
//  ContentView.swift
//  Memorize
//
//  Created by Illya Sirosh on 18.01.2021.
//

import SwiftUI

struct Card: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 3)
            Text("😀")
                .font(.system(size: 72))
                .padding()
            
        }.foregroundColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Card()
            .preferredColorScheme(.dark)
    }
}

