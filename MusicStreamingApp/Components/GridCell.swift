//
//  GridItem.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 17..
//

import SwiftUI

struct GridCell: View {
    let text: String
    let imagePath: String = ""
    let isPlaying: Bool = false

    var body: some View {
        HStack {
            Image(imagePath)
                .resizable()
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
        .background(Color.backgroundSecondary)
        .cornerRadius(10)
    }
}

struct GridCell_Previews: PreviewProvider {
    static var previews: some View {
        GridCell(text: "Top Hits")
    }
}
