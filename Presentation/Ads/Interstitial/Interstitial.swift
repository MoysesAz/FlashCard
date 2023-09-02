//
//  InterstitialNEW.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 29/08/23.
//

import UIKit
import GoogleMobileAds
import SwiftUI

class ViewController: UIViewController, GADFullScreenContentDelegate, ObservableObject {
    @Published var ad: GADInterstitialAd?
    var completionEvent: () -> () = {}

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910",
                               request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            self.ad = ad
            self.ad?.fullScreenContentDelegate = self
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
    var viewController: ViewController

    func makeUIViewController(context: Context) -> some UIViewController {
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

class Interstitial: ObservableObject {
    @ObservedObject var viewController: ViewController = ViewController()
    var view: InterstitialView?

    init() {
        self.view = InterstitialView(viewController: self.viewController)
    }
}
