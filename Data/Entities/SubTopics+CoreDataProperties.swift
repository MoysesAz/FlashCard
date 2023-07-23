//
//  SubTopics+CoreDataProperties.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 20/07/23.
//
//

import Foundation
import CoreData

extension SubTopic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SubTopic> {
        return NSFetchRequest<SubTopic>(entityName: "SubTopic")
    }

    @NSManaged public var creationDate: Date
    @NSManaged public var name: String
    @NSManaged public var subTopicsID: UUID
    @NSManaged public var cards: NSSet?
    @NSManaged public var topic: Topic

}

// MARK: Generated accessors for cards
extension SubTopic {

    @objc(addCardsObject:)
    @NSManaged public func addToCards(_ value: Card)

    @objc(removeCardsObject:)
    @NSManaged public func removeFromCards(_ value: Card)

    @objc(addCards:)
    @NSManaged public func addToCards(_ values: NSSet)

    @objc(removeCards:)
    @NSManaged public func removeFromCards(_ values: NSSet)

}

extension SubTopic : Identifiable {

}
