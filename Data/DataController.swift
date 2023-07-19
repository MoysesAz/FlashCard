//
//  DataController.swift
//  Data
//
//  Created by Moyses Miranda do Vale Azevedo on 01/06/23.
//

import CoreData

public class DataController: ObservableObject {
    public static let shared = DataController()
    public let container = NSPersistentContainer(name: "Deck")

    public init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }

    public func save() {
        do {
            try container.viewContext.save()
        } catch {
            print(error)
        }
    }
}

