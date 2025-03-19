//
//  ThemeViewModifier.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import SwiftUI

struct ThemedViewModifier: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager

    func body(content: Content) -> some View {
        content
            .preferredColorScheme(themeManager.selectedTheme == .light ? .light : .dark)
    }
}

extension View {
    func themed() -> some View {
        self.modifier(ThemedViewModifier())
    }
}
