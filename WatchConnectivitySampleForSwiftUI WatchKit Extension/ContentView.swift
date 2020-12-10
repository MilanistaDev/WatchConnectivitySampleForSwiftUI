//
//  ContentView.swift
//  WatchConnectivitySampleForSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2020/12/10.
//

import SwiftUI

struct ContentView: View {
    let animals = ["ネコ", "イヌ", "ハムスター", "ドラゴン", "ユニコーン"]
    let emojiAnimals = ["🐱", "🐶", "🐹", "🐲", "🦄"]
    
    var body: some View {
        List(0 ..< animals.count) { index in
            Button {
                // タップ時の処理
            } label: {
                HStack {
                    Text(self.emojiAnimals[index])
                        .font(.title)
                        .padding()
                    Text(self.animals[index])
                }
            }
        }
        .listStyle(CarouselListStyle())
        .navigationBarTitle(Text("Animal List"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
