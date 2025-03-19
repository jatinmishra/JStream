//
//  VideoPlayerView.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoURL: URL
    let autoPlay: Bool
    @State private var player = AVPlayer()
    @Environment(\.dismiss) var dismiss  // To handle back navigation
    let analyticsService: AnalyticsService?

    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    forceLandscapeMode()
                    player.allowsExternalPlayback = true
                    let playerItem = AVPlayerItem(url: videoURL)
                    player.replaceCurrentItem(with: playerItem)
                    if autoPlay { player.play() }
                    analyticsService?.startTracking(player: player, videoTitle: "Sample Video")
                }
                .onDisappear {
                    player.pause()
                    forcePortraitMode()
                    analyticsService?.stopTracking()
                }

            // Dismiss Button (Optional for smooth navigation)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()  // Dismiss the fullscreen player
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                    .padding(.top, 40)
                    .padding(.trailing, 20)
                }
                Spacer()
            }
        }
    }

    // Force Landscape Mode
    private func forceLandscapeMode() {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        scene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeRight))
    }

    // Force Portrait Mode
    private func forcePortraitMode() {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        scene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
    }
}


