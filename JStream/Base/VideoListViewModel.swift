//
//  VideoListViewModel.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import SwiftUI

class VideoListViewModel: ObservableObject {
    @Published var videoItems: [VideoItem] = []

    init() {
        loadInitialData()
    }

    private let initialVideos = [
        VideoItem(
            title: "Tears of Steel",
            url: URL(string: "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8")!,
            thumbnail: "https://picsum.photos/50/100?random=1",
            description: "A futuristic sci-fi short film."
        ),
        VideoItem(
            title: "Big Buck Bunny",
            url: URL(string: "https://ireplay.tv/test/blender.m3u8")!,
            thumbnail: "https://picsum.photos/50/100?random=2",
            description: "A cheerful short film with a playful bunny."
        ),
        VideoItem(
            title: "Sintel",
            url: URL(string: "https://moctobpltc-i.akamaihd.net/hls/live/571329/eight/playlist.m3u8")!,
            thumbnail: "https://picsum.photos/50/100?random=3",
            description: "A fantasy short film about a girl on a journey."
        ),
        VideoItem(
            title: "NASA TV",
            url: URL(string: "https://ntv1.akamaized.net/hls/live/2014075/NASA-NTV1-HLS/master_2000.m3u8")!,
            thumbnail: "https://picsum.photos/50/100?random=4",
            description: "Live broadcast from NASA TV."
        ),
        VideoItem(
            title: "Live News Channel",
            url: URL(string: "https://iptv-org.github.io/iptv/categories/auto.m3u")!,
            thumbnail: "https://picsum.photos/50/100?random=6",
            description: "24/7 breaking news coverage."
        ),
        VideoItem(
            title: "Sports Highlights",
            url: URL(string: "https://sportsstreaming.com/highlights/football.m3u8")!,
            thumbnail: "https://picsum.photos/50/100?random=7",
            description: "Top moments from the latest football matches."
        ),
        VideoItem(
            title: "Music Concert Live",
            url: URL(string: "https://musicconcerts.com/live-stream/concert.m3u8")!,
            thumbnail: "https://picsum.photos/50/100?random=8",
            description: "Live music concert featuring top artists."
        ),
        VideoItem(
            title: "Cooking Channel",
            url: URL(string: "https://cookingshows.com/stream/cooking.m3u8")!,
            thumbnail: "https://picsum.photos/50/100?random=9",
            description: "Step-by-step cooking tutorials from professional chefs."
        ),
        VideoItem(
            title: "Travel Adventure Series",
            url: URL(string: "https://traveladventure.com/episodes/adventure.m3u8")!,
            thumbnail: "https://picsum.photos/50/100?random=10",
            description: "Explore breathtaking destinations worldwide."
        ),
        VideoItem(
            title: "Tech Talks & Innovations",
            url: URL(string: "https://techtalks.com/live-stream/innovation.m3u8")!,
            thumbnail: "https://picsum.photos/50/100?random=11",
            description: "Latest trends and innovations in technology."
        )
    ]

    private func loadInitialData() {
        videoItems = initialVideos
    }
}
