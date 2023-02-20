//
//  MusicService.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import Firebase

struct AlbumService {
    /// Returns a closure with albums according to the API call.
    ///
    ///  - Parameters:
    ///     - completion: Closure of Albums.
    ///  - Returns: A closure of Albums.
    func fetchAlbums(completion: @escaping ([Album]) -> Void) {
        Firestore.firestore().collection("albums").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let albums = documents.compactMap { try? $0.data(as: Album.self) }
            completion(albums)
        }
    }
}
