//
//  Playlist.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import Firebase
import FirebaseFirestoreSwift

struct Playlist: Identifiable, Decodable {
    @DocumentID var id: String?
    var playlistId = UUID().uuidString
    let name: String
    let imagePath: String
    let sons: [Song]
}
