//
//  Topic+CoreDataProperties.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 20/07/23.
//
//

import Foundation
import CoreData

extension Topic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Topic> {
        return NSFetchRequest<Topic>(entityName: "Topic")
    }

    @NSManaged public var creationDate: Date
    @NSManaged public var name: String
    @NSManaged public var topicID: UUID
    @NSManaged public var subTopics: NSSet?

}

// MARK: Generated accessors for subTopics
extension Topic {

    @objc(addSubTopicsObject:)
    @NSManaged public func addToSubTopics(_ value: SubTopic)

    @objc(removeSubTopicsObject:)
    @NSManaged public func removeFromSubTopics(_ value: SubTopic)

    @objc(addSubTopics:)
    @NSManaged public func addToSubTopics(_ values: NSSet)

    @objc(removeSubTopics:)
    @NSManaged public func removeFromSubTopics(_ values: NSSet)

}

extension Topic : Identifiable {

}
