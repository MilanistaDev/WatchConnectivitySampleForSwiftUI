//
//  MessageListViewModel.swift
//  WatchConnectivitySampleForSwiftUI
//
//  Created by Takuya Aso on 2020/12/10.
//

import SwiftUI
import WatchConnectivity

final class MessageListViewModel: NSObject {

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
    // メッセージ受信
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            let receivedAnimal = message["animal"] as? String ?? "UMA"
            let receivedEmoji = message["emoji"] as? String ?? "❓"
            print(receivedEmoji + receivedAnimal)  // 🐱ネコ
        }
    }
}
