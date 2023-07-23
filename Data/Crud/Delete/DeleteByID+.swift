//
//  DeleteByID.swift
//  Data
//
//  Created by Moyses Miranda do Vale Azevedo on 19/07/23.
//

import CoreData

extension DataController {
    public func deleteTopic(topic: Topic) {
        container.viewContext.delete(topic)
        save()
    }

    public func deleteSubTopic(subTopic: SubTopic) {
        container.viewContext.delete(subTopic)
        save()
    }

    public func deleteCard(card: Card) {
        container.viewContext.delete(card)
        save()
    }

    public func deleteTopicByID(id: UUID) {
        let topic = getTopicsByID(id: id).first!
        container.viewContext.delete(topic)
        save()
    }

    public func deleteSubTopicByID(id: UUID) {
        let subtopic = getSubTopicsByID(id: id).first!
        container.viewContext.delete(subtopic)
        save()
    }

    public func deleteCardByID(id: UUID) {
        let card = getCardByID(id: id).first!
        container.viewContext.delete(card)
        save()
    }

}
