//
//  Banner.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 23/07/23.
//

import UIKit
import SwiftUI
import GoogleMobileAds


struct BannerView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: GADAdSizeBanner)
        banner.adUnitID = "ca-app-pub-1227764449813396/5723250024"
        banner.load(GADRequest())
        let firstScene = UIApplication.shared.connectedScenes.first as! UIWindowScene
        let firstWindow = firstScene.windows.first!
        let root = firstWindow.rootViewController!
        banner.rootViewController = root
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}
