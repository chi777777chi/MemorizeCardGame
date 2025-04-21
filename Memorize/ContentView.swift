//
//  ContentView.swift
//  Memorize
//
//  Created by 陳泓齊 on 2025/4/17.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🦞", "🐷", "🐰", "🦎", "🐢","🔅", "🔇", "🔈"]
    @State var cardCount : Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding(20)
    }
    
    var cards: some View {
        LazyVGrid(columns:  [GridItem(.adaptive(minimum: 90))], spacing: 20){
            ForEach(0..<cardCount, id :\.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardCountAdjusters : some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }.imageScale(.large)
            .font(.title)
    }
    
    func cardCountAdjusters (by offset: Int, symbol : String)-> some View {
        Button(action:{
            cardCount += offset
        }, label:{
            Image(systemName: symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover : some View {
        cardCountAdjusters(by: -1, symbol : "rectangle.stack.badge.minus.fill")
    }
    var cardAdder : some View {
        cardCountAdjusters(by: +1, symbol : "rectangle.stack.badge.plus.fill")
    }
    
}


struct CardView: View {
    let content :String
    @State var isFaceUp = true
    var body: some View {
    
        ZStack(alignment: .center ){
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture{
//            isFaceUp = !isFaceUp
            isFaceUp.toggle()
            print("tapped")
        }
    }
}
#Preview {
    ContentView()
}
