//
//  Album.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import Firebase
import FirebaseFirestoreSwift

struct Album: Identifiable, Decodable {
    @DocumentID var id: String?
    var albumId = UUID().uuidString
    let title: String
    let imagePath: String
    var isPlaying: Bool = false
    let songs: [Song]
}
