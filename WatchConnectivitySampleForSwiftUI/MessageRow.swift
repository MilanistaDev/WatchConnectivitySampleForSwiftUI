//
//  MessageRow.swift
//  WatchConnectivitySampleForSwiftUI
//
//  Created by Takuya Aso on 2020/12/10.
//

import SwiftUI

struct MessageRow: View {
    //let animal: String
    let animalModel: AnimalModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(animalModel.emoji + animalModel.name)
                .font(.body)
                .padding(.vertical, 4.0)
            // 受信時のタイムスタンプ
            Text(Date().toString())
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}

struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        //MessageRow(animal: "🐱ネコ")
        MessageRow(animalModel: AnimalModel(name: "ネコ", emoji: "🐱"))
    }
}

