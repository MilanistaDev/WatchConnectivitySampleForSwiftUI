//
//  MessageListViewModel.swift
//  WatchConnectivitySampleForSwiftUI
//
//  Created by Takuya Aso on 2020/12/10.
//

import SwiftUI
import WatchConnectivity

final class MessageListViewModel: NSObject, ObservableObject {
    // 配列に変化があれば変更を通知
    @Published var messages: [String] = []
    @Published var messagesData: [AnimalModel] = []
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
}

extension MessageListViewModel: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("The session has completed activation.")
        }
    }
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    func sessionDidDeactivate(_ session: WCSession) {
    }
    // メッセージ受信[String: Any]
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            let receivedAnimal = message["animal"] as? String ?? "UMA"
            let receivedEmoji = message["emoji"] as? String ?? "❓"
            print(receivedEmoji + receivedAnimal)  // 🐱ネコ
            // 受信したメッセージを配列に格納し配列を更新
            self.messages.append(receivedEmoji + receivedAnimal)
        }
    }
    
    // メッセージ受信 Data型
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        DispatchQueue.main.async {
            guard let message = try? JSONDecoder().decode(AnimalModel.self, from: messageData) else {
                return
            }
            self.messagesData.append(message)
        }
    }
}
