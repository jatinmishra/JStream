//
//  VideoItem.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import Foundation

struct VideoItem: Identifiable, Equatable {  // ✅ Add Equatable
    let id = UUID()
    let title: String
    let url: URL
    let thumbnail: String
    let description: String

    // ✅ Conformance to Equatable
    static func == (lhs: VideoItem, rhs: VideoItem) -> Bool {
        lhs.id == rhs.id
    }
}
