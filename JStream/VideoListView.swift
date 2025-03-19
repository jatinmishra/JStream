//
//  VideoListView.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import SwiftUI

struct VideoListView: View {
    @StateObject private var viewModel = VideoListViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.videoItems) { item in
                        NavigationLink(destination: VideoPlayerView(videoURL: item.url)) {
                            VideoRowView(item: item)
                                .scaleEffect(1.05) // Subtle scaling effect
                                .animation(.spring(), value: viewModel.videoItems)
                        }
                        .onAppear {
                            if item.id == viewModel.videoItems.last?.id {
                                viewModel.loadMoreData()  // Infinite scroll trigger
                            }
                        }
                    }
                }
            }
            .navigationTitle("VOD & HLS Streams")
            .background(Color(.systemGroupedBackground))
        }
    }
}
