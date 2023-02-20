//
//  AlbumViewModel.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import Foundation

class AlbumViewModel: ObservableObject {
    @Published var album: Album?
    private var albumService = AlbumService()

    init(albumId: String) {
        fetchAlbumData(albumId)
    }

    func fetchAlbumData(_ albumId: String) {
        albumService.fetchAlbumData(withId: albumId) { album in
            self.album = album
        }
    }
}
