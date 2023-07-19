//
//  Card+CoreDataProperties.swift
//  Domain
//
//  Created by Moyses Miranda do Vale Azevedo on 19/07/23.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var cardID: UUID
    @NSManaged public var content: String
    @NSManaged public var creationDate: Date
    @NSManaged public var title: String?
    @NSManaged public var subTopic: SubTopic?

}

extension Card : Identifiable {

}
