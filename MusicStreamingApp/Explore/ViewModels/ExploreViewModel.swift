//
//  ExploreViewModel.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import Foundation

class ExploreViewModel: ObservableObject {
    /// Published property to store fetched albums.
    @Published var albums = [Album]()

    /// Album service instance.
    private var albumService = AlbumService()

    /// Init, calls the ``fetchAlbums()``.
    init() {
        fetchAlbums()
    }

    /// Calls the ``albumService`` ``fetchAlbums()`` function to get the albums.
    func fetchAlbums() {
        albumService.fetchAlbums { albums in
            self.albums = albums
        }
    }
}
