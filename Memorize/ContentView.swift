//
//  ContentView.swift
//  Memorize
//
//  Created by Pedro Delmondes  on 12/03/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎾", "🌞", "🚝", "🚨"]
    
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])

            }
        }
        
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill()
                    .foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
            
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
            
        }
    }
}


#Preview {
    ContentView()
}
