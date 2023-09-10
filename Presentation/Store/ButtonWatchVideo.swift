//
//  ButtonWatchVideo.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 24/07/23.
//

import SwiftUI

struct ButtonWatchVideo: View {
    let award: String
    let openAds: () -> ()

    var body: some View {
        Rectangle()
            .stroke(style: .init(lineWidth: 1))
            .overlay {
                VStack{
                    Spacer()
                    HStack{
                        Text("\(award) +")
                            .font(.system(size: 20))
                            .padding(10)
                    }
                    Spacer()
                    Button("watchVideo-string") {
                        openAds()
                    }
                    .padding(.bottom, 20)
                }
            }
            .padding(10)
            .buttonStyle(.borderedProminent)
    }
}

struct ButtonWatchVideo_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWatchVideo(award: "5 cards", openAds: {})
    }
}
