//
//  VideoControlsOverlay.swift
//  JStream
//
//  Created by Jatin on 19/03/25.
//

import SwiftUI
import AVKit

struct VideoControlsOverlay: View {
    let player: AVPlayer
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                // AirPlay Button
                AVRoutePickerViewRepresentable()
                    .frame(width: 44, height: 44)
                    .padding()
            }
        }
    }
}

struct AVRoutePickerViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> AVRoutePickerView {
        let routePickerView = AVRoutePickerView()
        routePickerView.activeTintColor = .blue
        routePickerView.tintColor = .white
        return routePickerView
    }

    func updateUIView(_ uiView: AVRoutePickerView, context: Context) {}
}

