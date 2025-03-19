//
//  VideoPlayerSDKConfiguration.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import Foundation

enum AnalyticsProvider {
    case mux
    case conviva
}

struct VideoPlayerSDKConfiguration {
    let analyticsProvider: AnalyticsProvider
    let autoPlay: Bool
    let showControls: Bool

    init(
        analyticsProvider: AnalyticsProvider = .mux,
        autoPlay: Bool = true,
        showControls: Bool = true
    ) {
        self.analyticsProvider = analyticsProvider
        self.autoPlay = autoPlay
        self.showControls = showControls
    }
}
