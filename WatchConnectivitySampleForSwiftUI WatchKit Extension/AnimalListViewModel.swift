//
//  AnimalListViewModel.swift
//  WatchConnectivitySampleForSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2020/12/10.
//

import WatchConnectivity

final class AnimalListViewModel: NSObject {
    
    var session: WCSession
    
    init(session: WCSession  = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
}

extension AnimalListViewModel: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("The session has completed activation.")
        }
    }
}
