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

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        DispatchQueue.global().async {
            GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "252c9b2d28fb4dbd719e823d6cf32c66" ]
        }
        return true
    }
}


@main
struct PresentationApp: App {
    @StateObject var dataController = DataController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            TopicView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
