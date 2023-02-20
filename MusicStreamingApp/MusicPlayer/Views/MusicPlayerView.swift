//
//  MusicPlayerView.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 20..
//

import SwiftUI

struct MusicPlayerView: View {
    @ObservedObject var musicPlayerViewModel: MusicPlayerViewModel
    @State var isPlaying: Bool = false

    init(song: Song) {
        self.musicPlayerViewModel = MusicPlayerViewModel(song: song)
    }

    func handleMusicPlayAction() {}

    var body: some View {
        Button {
            self.handleMusicPlayAction()
        } label: {
            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                .resizable()
        }
    }
}
