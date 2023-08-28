//
//  Interstitial.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 21/07/23.
//

import GoogleMobileAds
import SwiftUI
import UIKit

final class Interstitial: NSObject, GADFullScreenContentDelegate {
    var interstitial: GADInterstitialAd?
    override init() {
        super.init()
        self.loadInterstitial()
    }

    func loadInterstitial() {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910",
                               request: request,
                               completionHandler: { ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            self.interstitial = ad
            self.interstitial?.fullScreenContentDelegate = self
        })
    }

    /*
     po UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
     */

    func showAd() {
        if self.interstitial != nil {
            DispatchQueue.main.async {
                let window = UIApplication
                    .shared
                    .connectedScenes
                let lastWindow = window.flatMap{ ($0 as? UIWindowScene)?.windows ?? [] }.last
                guard let rootViewController = lastWindow?.rootViewController else { return }
                self.interstitial?.present(fromRootViewController: rootViewController)
            }
        } else {
            print("No load Interstitial")
            loadInterstitial()
        }
    }

    func removeLastWindow() {

    }
}
