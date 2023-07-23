//
//  Interstitial.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 21/07/23.
//


import GoogleMobileAds
import UIKit

final class Interstitial: NSObject, GADFullScreenContentDelegate {
    var interstitial: GADInterstitialAd?
    override init() {
        super.init()
        self.loadInterstitial()
    }

    func loadInterstitial() {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: "ca-app-pub-1227764449813396/7626771908",
                               request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
        })
    }

    func showAd() {
        if self.interstitial != nil {
            let root = UIApplication.shared.windows.first?.rootViewController
            self.interstitial?.present(fromRootViewController: root!)
            loadInterstitial()
        }else {
            print("No load Interstitial")
            loadInterstitial()
        }
    }
    
}
