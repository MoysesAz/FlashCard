//
//  StoreView.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 23/07/23.
//

import SwiftUI
import Data

struct StoreView: View {
    let ads = Interstitial()
    @ObservedObject var dataController = DataController.shared
    @Binding var topicSheet: TopicSheet?

    var body: some View {
                VStack{
                    HStack{
                        Button("tesxte") {
                            addTopic()
                        }
                        ButtonWatchVideo(award: "1 Topic", openAds: addTopic)
                        ButtonWatchVideo(award: "5 Cards", openAds: addCards)
                    }
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.borderedProminent)
                    BannerView()
                        .navigationBarTitle("Título da Tela")
                        .frame(height: 300)
                }
    }

    private func addTopic() {
        ads.showAd()
        //        dataController.addTopicRestrictions(number: 1)
    }

    private func addCards() {
        ads.showAd()

        //        dataController.addCardRestrictions(number: 5)
    }
}

//struct StoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreView()
//    }
//}
