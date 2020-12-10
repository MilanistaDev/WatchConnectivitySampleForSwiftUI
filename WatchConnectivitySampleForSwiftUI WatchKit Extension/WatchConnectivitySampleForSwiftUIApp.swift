//
//  WatchConnectivitySampleForSwiftUIApp.swift
//  WatchConnectivitySampleForSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2020/12/10.
//

import SwiftUI

@main
struct WatchConnectivitySampleForSwiftUIApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
