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

    func startStopMusic(withAlbum album: Album, song: Song, isMusicPlaying: Bool, completion: @escaping (Bool) -> Void) {
        let albumRef = Firestore.firestore().collection("albums").document(album.albumId)

        let musicData: [AnyHashable: Any] = [
            "category": song.category,
            "filePath": song.filePath,
            "imagePath": song.imagePath,
            "isPlaying": isMusicPlaying,
            "songId": song.songId,
            "time": song.time,
            "title": song.title
        ]

        let albumData: [AnyHashable: Any] = [
            "isPlaying": isMusicPlaying,
            "songs": FieldValue.arrayUnion([musicData])
        ]

        albumRef.updateData(["songs": FieldValue.arrayRemove([musicData])]) { success in
            if success != nil {
                albumRef.updateData(albumData) { error in
                    if let error = error {
                        print("Error updating document: \(error.localizedDescription) ")
                        completion(false)
                    } else {
                        print("DEBUG: Document successfully updated")
                        completion(true)
                    }
                }
            } else {
                completion(false)
            }
        }
    }
}
