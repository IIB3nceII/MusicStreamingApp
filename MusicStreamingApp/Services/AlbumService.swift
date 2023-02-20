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

    /// Returns a closure with album with the correct document id.
    ///
    ///  - Parameters:
    ///     - withId: Id of the album.
    ///     - completion: Closure of Albums.
    ///  - Returns: A closure of Album.
    func fetchAlbumData(withId albumId: String, completion: @escaping (Album) -> Void) {
        Firestore.firestore().collection("albums").document(albumId).getDocument { snapshot, _ in
            guard let snapshot = snapshot else { return }
            guard let album = try? snapshot.data(as: Album.self) else { return }
            completion(album)
        }
    }
}
