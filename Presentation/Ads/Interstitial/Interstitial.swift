//
//  InterstitialNEW.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 29/08/23.
//

import UIKit
import GoogleMobileAds
import SwiftUI

class ViewController: UIViewController, GADFullScreenContentDelegate {
    var ad: GADInterstitialAd?
    var completionEvent: () -> () = {}
    var adState: AdState?

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
            self.ad = ad
            self.ad?.fullScreenContentDelegate = self
            self.adState?.isAdReady = true
        }
        )
    }

    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }

    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }

    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
        completionEvent()
    }

    func presentAd() {
        guard let fullScreenAd = self.ad else {
            return print("Ad wasn't ready")
        }
        fullScreenAd.present(fromRootViewController: self)
    }
}

struct InterstitialView: UIViewControllerRepresentable {
    var viewController: ViewController = ViewController()
    @ObservedObject var adState: AdState

    func makeUIViewController(context: Context) -> some UIViewController {
        viewController.adState = adState
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

class AdState: ObservableObject {
    @Published var isAdReady: Bool = false
}
