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

    // Sample Data
    private let initialVideos = [
        VideoItem(
            title: "Tears of Steel",
            url: URL(string: "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8")!,
            thumbnail: "https://upload.wikimedia.org/wikipedia/commons/3/3f/Tears_of_Steel.jpg",
            description: "A futuristic sci-fi short film."
        ),
        VideoItem(
            title: "Big Buck Bunny",
            url: URL(string: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/playlist.m3u8")!,
            thumbnail: "https://upload.wikimedia.org/wikipedia/commons/7/75/Big_Buck_Bunny_first_flight.jpg",
            description: "A cheerful short film with a playful bunny."
        ),
        VideoItem(
            title: "Sintel",
            url: URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!,
            thumbnail: "https://upload.wikimedia.org/wikipedia/commons/7/70/Sintel_poster.jpg",
            description: "A fantasy short film about a girl on a journey."
        ),
        VideoItem(
            title: "NASA TV",
            url: URL(string: "https://nasatv-lh.akamaihd.net/i/NASA_101@319270/master.m3u8")!,
            thumbnail: "https://www.nasa.gov/sites/default/files/thumbnails/image/nasa-logo-web-rgb.png",
            description: "Live broadcast from NASA TV."
        )
    ]

    // Load initial data
    func loadInitialData() {
        videoItems = initialVideos
    }

    // Infinite Scroll Logic
    func loadMoreData() {
        videoItems.append(contentsOf: initialVideos)
    }
}
