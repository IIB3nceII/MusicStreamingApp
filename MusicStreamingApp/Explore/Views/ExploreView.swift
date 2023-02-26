//
//  ExploreView.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 17..
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var exploreViewModel = ExploreViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    LazyVGrid(columns: columns) {
                        ForEach(exploreViewModel.albums) { album in
                            NavigationLink {
                                AlbumView(albumId: album.albumId)
                            } label: {
                                GridCell(text: album.title)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
            .background(Color.backgroundSecondary)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
