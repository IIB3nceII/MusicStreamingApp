//
//  IconGifView.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 17..
//

import SDWebImageSwiftUI
import SwiftUI

struct IconGifView: View {
    var body: some View {
        AnimatedImage(url: getLogoURL())
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
    }

    func getLogoURL() -> URL {
        let bundle = Bundle.main.path(forResource: "sound", ofType: "gif")
        let url = URL(fileURLWithPath: bundle ?? "")
        return url
    }
}

struct IconGifView_Previews: PreviewProvider {
    static var previews: some View {
        IconGifView()
    }
}
