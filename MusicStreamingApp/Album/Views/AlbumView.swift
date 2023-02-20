//
//  AlbumView.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import SwiftUI

struct AlbumView: View {
    @ObservedObject var albumViewModel: AlbumViewModel

    init(albumId: String) {
        self.albumViewModel = AlbumViewModel(albumId: albumId)
    }

    var body: some View {
        ScrollView {
            LazyVStack {
                if let songs = albumViewModel.album?.songs {
                    ForEach(songs) { song in
                        NavigationLink {
                            MusicPlayerView(song: song)
                        } label: {
                            Text(song.title)
                        }
                    }
                }
            }
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView(albumId: "")
    }
}
