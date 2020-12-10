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
    
    var viewModel = AnimalListViewModel()
    
    var body: some View {
        List(0 ..< animals.count) { index in
            Button {
                // タップ時の処理
                // [String: Any] はこっち
                // self.sendMessage(index: index)
                // Data型はこっち
                self.sendMessageData(index: index)
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
    
    private func sendMessage(index: Int) {
        let messages: [String: Any] =
            ["animal": animals[index],
             "emoji": emojiAnimals[index]]
        self.viewModel.session.sendMessage(messages, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
    }
    
    private func sendMessageData(index: Int) {
        let animal = AnimalModel(name: animals[index], emoji: emojiAnimals[index])
        guard let data = try? JSONEncoder().encode(animal) else {
            return
        }
        self.viewModel.session.sendMessageData(data, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
