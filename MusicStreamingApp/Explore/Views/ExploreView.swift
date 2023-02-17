//
//  ExploreView.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 17..
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                Grid {
                    GridRow {
                        GridItem(text: "Top hits")
                        GridItem(text: "Top hits")
                    }
                    GridRow {
                        GridItem(text: "Top hits")
                        GridItem(text: "Top hits")
                    }
                    GridRow {
                        GridItem(text: "Top hits")
                        GridItem(text: "Top hits")
                    }
                }

                ForEach(1 ... 100, id: \.self) { _ in
                    Text("asd")
                }
            }
        }
        .padding()
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
