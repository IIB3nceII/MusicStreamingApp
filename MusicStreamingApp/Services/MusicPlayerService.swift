//
//  MusicPlayerService.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import Firebase
import FirebaseStorage

struct MusicPlayerService {
    func fetchMusic(withPath filePath: String, completion: @escaping (URL) -> Void) {
        Storage.storage().reference(forURL: filePath).downloadURL { url, _ in
            guard let url = url else { return }
            completion(url)
        }
    }

    func startStopMusic(withId songId: String, isMusicPlaying: Bool, completion: @escaping (Bool) -> Void) {
        Firestore.firestore().collection("songs").document(songId).updateData(["isPlaying": isMusicPlaying]) { error in
            if let error = error {
                print("Error updating document: \(error.localizedDescription) ")
                completion(false)
            }
            else {
                print("Document successfully updated")
                completion(true)
            }
        }
    }
}
