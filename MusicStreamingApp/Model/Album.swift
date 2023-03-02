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
    let albumId: String
    let title: String
    var imagePath: String
    var isPlaying: Bool = false
    let songs: [Song]
}
