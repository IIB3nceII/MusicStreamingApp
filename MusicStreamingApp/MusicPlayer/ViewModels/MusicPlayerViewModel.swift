//
//  MusicPlayerViewModel.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import AVFoundation
import Foundation

class MusicPlayerViewModel: ObservableObject {
    @Published var currentSong: Song?
    private var musicPlayerService = MusicPlayerService()
    var player = AVPlayer()

    init(song: Song) {
        fetchMusic(withFilePath: song.filePath)
    }

    private func fetchMusic(withFilePath path: String) {
        musicPlayerService.fetchMusic(withPath: path) { url in
            self.player = AVPlayer(playerItem: AVPlayerItem(url: url))
            self.player.play()
        }
    }
}
