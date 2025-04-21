//
//  ContentView.swift
//  Memorize
//
//  Created by 陳泓齊 on 2025/4/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojis = ["🦞", "🐷", "🐰", "🦎", "🐢"]
        HStack{
            ForEach(emojis.indices, id :\.self){ index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.orange)
        .padding(20)
    }
}


struct CardView: View {
    let content :String
    @State var isFaceUp = true
    var body: some View {
    
        ZStack(alignment: .center ){
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }else{
                base.fill()
            }
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
