
//
//  VideoListView.swift
//  Africa
//
//  Created by MacBook Pro on 23/10/2026.
//

import SwiftUI
import AVKit

struct VideoListView: View {

    // MARK: - PROPERTIES

    @State private var videos: [Video] = Bundle.main.decode("videos")

    private let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - BODY

    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(
                        destination: VideoPlayerView(
                            videoSelected: video.id,
                            videoTitle: video.name
                        )
                    ) {
                        VideoListItem(video: video)
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                            .foregroundColor(.accentColor)
                    }
                }
            }
        }
    }
}

#Preview {
    VideoListView()
}
