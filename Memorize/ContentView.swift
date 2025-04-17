//
//  ContentView.swift
//  Memorize
//
//  Created by 陳泓齊 on 2025/4/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.orange)
        .padding(20)
    }
}


struct CardView: View {
    @State var isFaceUp = false
    var body: some View {
    
        ZStack(alignment: .center ){
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text("🦞").font(.largeTitle)
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
