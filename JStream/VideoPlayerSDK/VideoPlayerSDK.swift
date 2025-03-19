//
//  VideoPlayerSDK.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import SwiftUI
import AVKit

class VideoPlayerSDK: ObservableObject {
    private let config: VideoPlayerSDKConfiguration
    private var analyticsService: AnalyticsService?

    init(config: VideoPlayerSDKConfiguration) {
        self.config = config
        self.analyticsService = config.analyticsProvider == .mux ? MuxAnalyticsService() : ConvivaAnalyticsService()
    }

    func videoPlayerView(for videoURL: URL, videoTitle: String) -> some View {
        VideoPlayerView(
            videoURL: videoURL,
            autoPlay: config.autoPlay,
            analyticsService: analyticsService
        )
    }
}
