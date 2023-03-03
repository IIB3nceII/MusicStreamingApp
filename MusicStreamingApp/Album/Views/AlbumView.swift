//
//  AlbumView.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import SwiftUI

struct AlbumView: View {
    @ObservedObject private var albumViewModel: AlbumViewModel

    init(albumId: String) {
        self.albumViewModel = AlbumViewModel(albumId: albumId)
    }

    var body: some View {
        ScrollView {
            BackButton()

            LazyVStack(spacing: 2) {
                if let songs = albumViewModel.album?.songs {
                    ForEach(songs, id:\.songId) { song in
                        HStack {
                            NavigationLink {
                                MusicPlayerView(song: song, albumId: albumViewModel.album?.albumId ?? "")
                            } label: {
                                HStack(spacing: 8) {
                                    Text(song.title)
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                        .truncationMode(.tail)
                                        .lineLimit(1)
                                }
                                .padding()
                            }

                            Spacer()
                            Image(systemName: "ellipsis")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .padding()
        }
        .toolbar(.hidden)
        .background(Color.backgroundSecondary)
    }
}
