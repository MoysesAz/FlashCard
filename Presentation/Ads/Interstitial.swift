//
//  Interstitial.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 21/07/23.
//


import GoogleMobileAds
import UIKit


class MyView: UIViewController, GADFullScreenContentDelegate {
  private var interstitial: GADInterstitialAd?

  override func viewDidLoad() {
    super.viewDidLoad()
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
                      }
    )
  }


  /// Tells the delegate that the ad failed to present full screen content.
  func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
    print("Ad did fail to present full screen content.")
  }

  /// Tells the delegate that the ad will present full screen content.
  func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
    print("Ad will present full screen content.")
  }

  /// Tells the delegate that the ad dismissed full screen content.
  func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
    print("Ad did dismiss full screen content.")
  }
}

