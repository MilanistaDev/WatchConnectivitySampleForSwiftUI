//
//  ContentView.swift
//  WatchConnectivitySampleForSwiftUI
//
//  Created by Takuya Aso on 2020/12/10.
//

import SwiftUI

struct ContentView: View {
    // @ObservedObject をつけてメッセージ配列の変更通知を受け取る
    @ObservedObject var viewModel = MessageListViewModel()
    @State private var isReachable = "NO"
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        // iPhone と Apple Watch が疎通できるか
                        // true の場合メッセージ送信可能
                        self.isReachable = self.viewModel.session.isReachable ? "YES": "NO"
                    }) {
                        Text("Check")
                    }
                    .padding(.leading, 16.0)
                    Spacer()
                    Text("isReachable")
                        .font(.headline)
                        .padding()
                    Text(self.isReachable)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding()
                }
                .background(Color.init(.systemGray5))
                List {
                    ForEach(self.viewModel.messages, id: \.self) { animal in
                        MessageRow(animal: animal)
                    }
                }
                .listStyle(PlainListStyle())
                Spacer()
            }
            .navigationTitle("Receiver")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
