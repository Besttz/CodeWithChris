//
//  M5App.swift
//  M5
//
//  Created by ZhangTommy on 20/10/2022.
//

import SwiftUI

@main
struct M5App: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
