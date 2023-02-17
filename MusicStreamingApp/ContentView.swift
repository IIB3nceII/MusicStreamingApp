//
//  ContentView.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 17..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainTabView()
            .toolbar(.hidden)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
