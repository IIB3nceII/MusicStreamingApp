//
//  Artist.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import Firebase
import FirebaseFirestoreSwift

struct Artist: Identifiable, Decodable {
    @DocumentID var id: String?
    var artistId = UUID().uuidString
    let name: String
    let imagePath: String
    let albums: [Album]
}
