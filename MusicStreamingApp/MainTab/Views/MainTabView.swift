//
//  MainTabView.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 17..
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTabIndex = 0

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            ExploreView()
                .onTapGesture {
                    self.selectedTabIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)

            SearchView()
                .onTapGesture {
                    self.selectedTabIndex = 0
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)

            LibraryView()
                .onTapGesture {
                    self.selectedTabIndex = 0
                }
                .tabItem {
                    Image(systemName: "play.square.stack")
                }
                .tag(2)
        }
        .tint(.primary)
        .background(Color.backgroundSecondary)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
