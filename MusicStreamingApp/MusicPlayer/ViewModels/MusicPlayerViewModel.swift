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
        self.currentSong = song
    }

    public func fetchMusic(withFilePath path: String) {
        musicPlayerService.fetchMusic(withPath: path) { url in
            self.player = AVPlayer(playerItem: AVPlayerItem(url: url))
            self.player.play()
        }
    }

    public func handleMusicPlayAction(isMusicPlaying: Bool) {
        guard let song = currentSong else { return }
        musicPlayerService.startStopMusic(withId: song.songId, isMusicPlaying: isMusicPlaying) { success in
            if success {
                self.currentSong?.isPlaying = isMusicPlaying
                isMusicPlaying ? self.player.play() : self.player.pause()
            }
        }
    }
}
