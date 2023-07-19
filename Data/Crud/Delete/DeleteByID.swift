//
//  DeleteByID.swift
//  Data
//
//  Created by Moyses Miranda do Vale Azevedo on 19/07/23.
//

import CoreData

extension DataController {
    public func deleteTopicByID(id: UUID) {
        let topic = getTopicsByID(id: id).first!
        container.viewContext.delete(topic)
        save()
    }
}
