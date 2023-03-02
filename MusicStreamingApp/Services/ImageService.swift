//
//  ImageService.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 03. 02..
//

import FirebaseStorage
import Foundation

struct ImageService {
    /// Returns an url from firebase url path.
    ///
    ///  - Parameters:
    ///     - path: firebase path
    ///     - completion: Closure of URL
    ///  - Returns: Void
    func getImageURL(path: String, completion: @escaping (URL) -> Void) {
        let storage = Storage.storage()
        storage.reference().child(path).downloadURL(completion: { url, error in
            guard let url = url, error == nil else { return }
            completion(url)
        })
    }
}
