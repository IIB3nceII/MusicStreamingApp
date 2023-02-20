//
//  MusicStreamingApp.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 17..
//

import Firebase
import SwiftUI

@main
struct MusicStreamingAppApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
