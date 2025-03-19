//
//  ThemeChanger.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import SwiftUI

enum Theme: String {
    case light, dark
}

class ThemeManager: ObservableObject {
    @AppStorage("theme") var selectedTheme: Theme = .light
}
