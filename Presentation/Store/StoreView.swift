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
    @Binding var stateSheet: StateSheet?
    @ObservedObject var adState: AdState = AdState()
    @State private var interstitialView: InterstitialView? // Propriedade para manter a referência

    var body: some View {
        Text("")
            .onAppear {
                interstitialView = InterstitialView(adState: adState)
            }
        interstitialView?
            .frame(width: .zero, height: .zero)
        if adState.isAdReady {
            story
        } else {
            loadingView
        }
    }

    var loadingView: some View {
        VStack {
            ProgressView()
        }
    }

    var story: some View {
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
                }
        }
    }

    private func addTopic() {
        interstitialView?.viewController.presentAd()
        interstitialView?.viewController.completionEvent = {
            dataController.addTopicRestrictions(number: 1)
            stateSheet = .showingCreating
        }
    }

    private func addCards() {
        interstitialView?.viewController.presentAd()
        interstitialView?.viewController.completionEvent = {
            dataController.addCardRestrictions(number: 5)
            stateSheet = .showingCreating
        }
    }
}
