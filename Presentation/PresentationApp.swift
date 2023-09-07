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
//        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers =
//            [ "2077ef9a63d2b398840261c8221a0c9b" ]
//        return true
//    }
//}

@main
struct PresentationApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
           TopicView()
        }
    }
}
