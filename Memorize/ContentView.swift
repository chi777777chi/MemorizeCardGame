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
    var isFaceUp: Bool = false
    var body: some View {
        ZStack{
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 5)
                Text("🦞")
            }else{
                RoundedRectangle(cornerRadius: 12)
//                    .foregroundStyle(.gray)
            }
        }
    }
}
#Preview {
    ContentView()
}
