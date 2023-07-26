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
            .cornerRadius(60)
            .border(.black, width: 2)
            .foregroundColor(.white)
            .overlay {
                VStack{
                    Spacer()
                    HStack{
                        Text("Watch a video to get \(award)")
                            .font(.system(size: 30))
                            .padding(10)
                    }
                    Spacer()
                    Button("WatchVideo") {
                        openAds()
                    }
                    .padding(.bottom, 10)
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
