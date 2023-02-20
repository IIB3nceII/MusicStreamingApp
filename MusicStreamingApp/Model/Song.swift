//
//  File.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import Firebase
import FirebaseFirestoreSwift

struct Song: Identifiable, Decodable {
    @DocumentID var id: String?
    let songId: String
    let title: String
    let imagePath: String
    let filePath: String
    let time: String
    let category: String
    var isPlaying: Bool = false
}
