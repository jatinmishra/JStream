//
//  VideoRowView.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import SwiftUI

struct VideoRowView: View {
    let item: VideoItem
    @State private var isVisible = false  // For fade-in effect

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: item.thumbnail)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 60)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 60)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }

            Spacer()
        }
        .padding(8)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
        .opacity(isVisible ? 1 : 0)  // Fade-in animation
        .onAppear {
            withAnimation(.easeInOut(duration: 0.6)) {
                isVisible = true
            }
        }
    }
}
