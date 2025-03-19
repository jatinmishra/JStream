//
//  AnalyticsManager.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import Foundation
import AVKit

protocol AnalyticsService {
    func startTracking(player: AVPlayer, videoTitle: String)
    func stopTracking()
}
