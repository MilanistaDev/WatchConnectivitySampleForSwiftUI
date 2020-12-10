//
//  ContentView.swift
//  WatchConnectivitySampleForSwiftUI
//
//  Created by Takuya Aso on 2020/12/10.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel = MessageListViewModel()
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
