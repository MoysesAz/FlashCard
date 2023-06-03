//
//  PresentationApp.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 01/06/23.
//

import SwiftUI
import Data
import CoreData

@main
struct PresentationApp: App {
    @StateObject var dataController = DataController.shared

    var body: some Scene {
        WindowGroup {
            TopicView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
