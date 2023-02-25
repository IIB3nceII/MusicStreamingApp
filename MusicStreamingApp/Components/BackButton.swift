//
//  BackButton.swift
//  MusicStreamingApp
//
//  Created by Bence Papp on 2023. 02. 25..
//

import SwiftUI

struct BackButton: View {
    /// PresentationMode env prop.
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.backward")
                .padding()
                .font(.title2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
