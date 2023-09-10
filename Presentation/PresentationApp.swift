//
//  PresentationApp.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 01/06/23.
//

import SwiftUI
import Data
import GoogleMobileAds
import UIKit

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        GADMobileAds.sharedInstance().start(completionHandler: nil)
//        return true
//    }
//}

@main
struct PresentationApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
//        GADMobileAds.sharedInstance().start(completionHandler: nil)
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "d2c998b7676afd2b2f78b348c760ac69" ]
    }

    var body: some Scene {
        WindowGroup {
           TopicView()
        }
    }
}
