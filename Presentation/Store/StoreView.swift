//
//  StoreView.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 23/07/23.
//

import SwiftUI
import Data

struct StoreView: View {
    @ObservedObject var dataController = DataController.shared
    @ObservedObject var viewController = ViewController()
    @ObservedObject var interstitial: Interstitial =  Interstitial()
    @Binding var stateSheet: StateSheet?
    var interstitialView: InterstitialView?

    var body: some View {
        GeometryReader { geometry in
                VStack{
                    HStack{
                        ButtonWatchVideo(award: "1 Topic", openAds: addTopic)
                        ButtonWatchVideo(award: "5 Cards", openAds: addCards)
                    }
                    .padding()
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.borderedProminent)
                    BannerView()
                        .navigationBarTitle("Título da Tela")
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.10)
                        .background()
                    interstitial.view
                        .frame(width: .zero, height: .zero)
                }

        }
    }

    private func addTopic() {
        interstitial.viewController.presentAd()
        interstitial.viewController.completionEvent = {
            dataController.addTopicRestrictions(number: 1)
            stateSheet = .showingCreating
        }
    }

    private func addCards() {
        interstitial.viewController.presentAd()
        interstitial.viewController.completionEvent = {
            dataController.addCardRestrictions(number: 5)
            stateSheet = .showingCreating
        }
    }
}
