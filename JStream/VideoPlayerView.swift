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
    @State private var player = AVPlayer()
    @State private var isLoading = true

    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .onAppear {
                    let playerItem = AVPlayerItem(url: videoURL)
                    player.replaceCurrentItem(with: playerItem)
                    player.play()

                    // Observer for loading
                    playerItem.addObserver(self, forKeyPath: "status", options: .new, context: nil)
                }
                .onDisappear {
                    player.pause()
                }
                .overlay(VideoControlsOverlay(player: player)) // AirPlay Controls

            if isLoading {
                ProgressView("Loading video...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(12)
                    .frame(width: 120, height: 120)
            }
        }
        .onRotate { newOrientation in
            if newOrientation.isLandscape {
                player.play()
            } else {
                player.pause()
            }
        }
    }

    // Video Loading Observer
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status", let playerItem = object as? AVPlayerItem {
            DispatchQueue.main.async {
                self.isLoading = playerItem.status != .readyToPlay
            }
        }
    }
}
