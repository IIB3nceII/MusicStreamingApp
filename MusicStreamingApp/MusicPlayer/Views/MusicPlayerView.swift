//
//  MusicPlayerView.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import Kingfisher
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

            VStack {
                Spacer()

                KFImage(musicPlayerViewModel.songImagePathUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 36)

                HStack(spacing: 36) {
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

                Spacer()
            }
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
