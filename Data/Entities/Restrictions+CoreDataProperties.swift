//
//  Restrictions+CoreDataProperties.swift
//  Domain
//
//  Created by Moyses Miranda do Vale Azevedo on 21/07/23.
//
//

import Foundation
import CoreData


extension Restrictions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restrictions> {
        return NSFetchRequest<Restrictions>(entityName: "Restrictions")
    }

    @NSManaged public var cardLimit: Int16
    @NSManaged public var topicLimit: Int16
    @NSManaged public var restrictionsID: UUID?

}

extension Restrictions : Identifiable {

}
