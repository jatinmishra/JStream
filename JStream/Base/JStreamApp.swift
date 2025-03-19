//
//  JStreamApp.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import SwiftUI

@main
struct MyAppApp: App {
    @StateObject private var themeManager = ThemeManager()

    var body: some Scene {
        WindowGroup {
            LaunchScreen()
                .environmentObject(themeManager) // ✅ Inject theme manager globally
        }
    }
}
