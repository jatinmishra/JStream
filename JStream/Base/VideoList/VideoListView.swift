//
//  VideoListView.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import SwiftUI

struct VideoListView: View {
    @StateObject private var viewModel = VideoListViewModel()
    @EnvironmentObject var themeManager: ThemeManager  // ✅ Inject ThemeManager
    private let videoPlayerSDK = VideoPlayerSDK(config: .init(analyticsProvider: .mux, autoPlay: true))

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.videoItems) { item in
                        NavigationLink(destination: videoPlayerSDK.videoPlayerView(for: item.url, videoTitle: item.title)
                                        .navigationBarHidden(true)
                                        .navigationBarBackButtonHidden(true)) {
                            VideoRowView(item: item)
                        }
                    }
                }
            }
            .navigationTitle("JStream")
            .navigationBarItems(trailing: themeSwitcherButton)
        }
        .themed() // ✅ Apply theme here
    }

    // ✅ Theme Switcher Button
    private var themeSwitcherButton: some View {
        Button(action: {
            themeManager.selectedTheme = themeManager.selectedTheme == .light ? .dark : .light
        }) {
            Image(systemName: themeManager.selectedTheme == .light ? "moon.fill" : "sun.max.fill")
                .font(.title2)
                .foregroundColor(.primary)
        }
    }
}
