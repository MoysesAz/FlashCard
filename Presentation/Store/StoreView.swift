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
    @State private var interstitialView: InterstitialView = InterstitialView() // Propriedade para manter a referência
    @State private var showProgressView = true

    var body: some View {
        VStack {
            interstitialView
                .frame(width: .zero, height: .zero)
            if showProgressView {
                loadingView
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1.8, repeats: false) { _ in
                            withAnimation {
                                showProgressView = false
                            }
                        }
                    }
            } else {
                story
            }
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
                        ButtonWatchVideo(award:
                                            NSLocalizedString("topicStory-string", comment: "")
                                            , openAds: addTopic)
                        ButtonWatchVideo(award: NSLocalizedString("cardStory-string", comment: ""), openAds: addCards)
                    }
                    .padding()
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.borderedProminent)
                    BannerView()
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.10)
                        .background()
                }
        }
    }

    private func addTopic() {
        interstitialView.viewController.presentAd()
        interstitialView.viewController.completionEvent = {
            dataController.addTopicRestrictions(number: 1)
            stateSheet = .showingCreating
        }
    }

    private func addCards() {
        interstitialView.viewController.presentAd()
        interstitialView.viewController.completionEvent = {
            dataController.addCardRestrictions(number: 5)
            stateSheet = .showingCreating
        }
    }
}
