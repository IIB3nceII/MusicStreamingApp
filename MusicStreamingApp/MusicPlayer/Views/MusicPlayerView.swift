//
//  MusicPlayerView.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import SwiftUI

struct MusicPlayerView: View {
    @ObservedObject var musicPlayerViewModel: MusicPlayerViewModel

    init(song: Song, albumId: String) {
        self.musicPlayerViewModel = MusicPlayerViewModel(song: song)
    }

    func handleMusicPlayButtonPress() {
        self.musicPlayerViewModel.currentSong!.isPlaying ? self.musicPlayerViewModel.handleMusicPlayAction(isMusicPlaying: false) : self.musicPlayerViewModel.handleMusicPlayAction(isMusicPlaying: true)
    }

    var body: some View {
        VStack {
            BackButton()

            Spacer()

            HStack(spacing: 12) {
                Button {
                    self.handleMusicPlayButtonPress()
                } label: {
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }

                Button {
                    self.handleMusicPlayButtonPress()
                } label: {
                    Image(systemName: musicPlayerViewModel.currentSong!.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }

                Button {
                    self.handleMusicPlayButtonPress()
                } label: {
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
            .padding(.bottom, 12)
        }
        .onAppear {
            if let song = self.musicPlayerViewModel.currentSong {
                self.musicPlayerViewModel.fetchMusic(withFilePath: song.filePath)
                self.musicPlayerViewModel.handleMusicPlayAction(isMusicPlaying: true)
            }
        }
        .toolbar(.hidden)
        .background(Color.backgroundSecondary)
    }
}
