//
//  LaunchScreen.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isActive = false
    @State private var logoScale = 0.6
    @State private var logoOpacity = 0.3
    @EnvironmentObject var themeManager: ThemeManager  // ✅ Inject ThemeManager

    var body: some View {
        if isActive {
            VideoListView()  // Navigate to main content
        } else {
            VStack {
                Image(systemName: "play.circle.fill")  // Replace with your app logo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .scaleEffect(logoScale)
                    .opacity(logoOpacity)
                    .foregroundColor(themeManager.selectedTheme == .light ? .blue : .gray)

                Text("JStream")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(themeManager.selectedTheme == .light ? .blue : .gray)
                    .padding(.top, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(themeManager.selectedTheme == .light ? Color.white : Color.black)  // ✅ Themed background
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5)) {
                    self.logoScale = 1.0
                    self.logoOpacity = 1.0
                }

                // Delay transition for smoother experience
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
