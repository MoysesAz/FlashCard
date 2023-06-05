//
//  Card+CoreDataProperties.swift
//  Domain
//
//  Created by Moyses Miranda do Vale Azevedo on 04/06/23.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var content: String?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var relationship: Topic?
}

extension Card : Identifiable {

}
