//
//  MuxAnalyticsService.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import Foundation
import AVKit
import MuxCore
import MUXSDKStats

class MuxAnalyticsService: AnalyticsService {
    private var muxMonitor: MUXSDKPlayerBinding?

    func startTracking(player: AVPlayer, videoTitle: String) {
        let customerData = MUXSDKCustomerData()
        let playerData = MUXSDKCustomerPlayerData()
        playerData.environmentKey = "1i7l88ifo8of71kp8cqa25gj8"
        
        let videoData = MUXSDKCustomerVideoData()
        videoData.videoTitle = videoTitle
        
        customerData.customerVideoData = videoData
        customerData.customerPlayerData = playerData

        guard let playerViewController = findAVPlayerViewController(from: player) else { return }

        muxMonitor = MUXSDKStats.monitorAVPlayerViewController(
            playerViewController,
            withPlayerName: "AVPlayer",
            customerData: customerData
        )
    }

    func stopTracking() {
        muxMonitor?.detachAVPlayer()
    }

    // Helper function to find AVPlayerViewController
    private func findAVPlayerViewController(from player: AVPlayer) -> AVPlayerViewController? {
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        return playerViewController
    }
}

