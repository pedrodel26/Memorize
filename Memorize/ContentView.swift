//
//  ContentView.swift
//  Memorize
//
//  Created by Pedro Delmondes  on 12/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: false)
            CardView(isFaceUp: false)
            CardView()
            CardView()
        }
        
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            var base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill()
                    .foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)
            }
            else {
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
