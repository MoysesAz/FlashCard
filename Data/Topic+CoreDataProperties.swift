//
//  Topic+CoreDataProperties.swift
//  Domain
//
//  Created by Moyses Miranda do Vale Azevedo on 04/06/23.
//
//

import Foundation
import CoreData


extension Topic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Topic> {
        return NSFetchRequest<Topic>(entityName: "Topic")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var relationship: NSSet?
    
}

// MARK: Generated accessors for relationship
extension Topic {

    @objc(addRelationshipObject:)
    @NSManaged public func addToRelationship(_ value: Topic)

    @objc(removeRelationshipObject:)
    @NSManaged public func removeFromRelationship(_ value: Topic)

    @objc(addRelationship:)
    @NSManaged public func addToRelationship(_ values: NSSet)

    @objc(removeRelationship:)
    @NSManaged public func removeFromRelationship(_ values: NSSet)

}

extension Topic : Identifiable {

}
