//
//  M5L8ChallengeApp.swift
//  M5L8Challenge
//
//  Created by ZhangTommy on 27/10/2022.
//

import SwiftUI

@main
struct M5L8ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
