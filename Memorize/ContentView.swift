//
//  ContentView.swift
//  Memorize
//
//  Created by Pedro Delmondes  on 12/03/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎾", "🌞", "🚝", "🛹", "🥅", "🔮", "💊", "🕷️", "🦹🏼","🐵", "🐍", "🕸️"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
        ForEach(0..<cardCount, id: \.self) { index in
            CardView(content: emojis[index])
                .aspectRatio(2/3, contentMode: .fill)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            
            cardAdder
            
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
         
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "folder.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "folder.fill.badge.plus")
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill()
                    .foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
            
        }
    }
}


#Preview {
    ContentView()
}
