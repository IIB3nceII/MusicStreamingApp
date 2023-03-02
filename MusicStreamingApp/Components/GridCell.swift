//
//  GridItem.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 17..
//

import Kingfisher
import SwiftUI

struct GridCell: View {
    let text: String
    var imagePath: String
    var isPlaying: Bool = false

    var body: some View {
        HStack {
            KFImage(URL(string: imagePath))
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
            Text(text)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.system(size: 16))
                .lineLimit(2)

            Spacer()

            if isPlaying {
                IconGifView()
            }
        }
        .padding()
        .background(Color.itemBackground)
        .cornerRadius(10)
        .onAppear {
            print(imagePath)
        }
    }
}

struct GridCell_Previews: PreviewProvider {
    static var previews: some View {
        GridCell(text: "Top Hits", imagePath: "gs://musicstreamingapp-d047f.appspot.com/images/summer-hits.png")
    }
}
