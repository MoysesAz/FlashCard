//
//  File.swift
//  Data
//
//  Created by Moyses Miranda do Vale Azevedo on 20/07/23.
//

import CoreData

extension DataController {
    public func uploadTopic(id: UUID, name: String) {
        let topic = getTopicsByID(id: id).first
        topic?.name = name
        save()
    }

    public func uploadSubTopic(id: UUID, name: String) {
        let subTopic = getSubTopicsByID(id: id).first
        subTopic?.name = name
        save()
    }

    public func uploadCard(id: UUID, title: String, content: String) {
        let card = getCardByID(id: id).first
        card?.title = title
        card?.content = content
        save()
    }

    public func uploadRestrictions(id: UUID, topicLimit: Int16, cardLimit: Int16) {
        let newRestrictions = getRestrictionsCardByID(id: id).first
        newRestrictions?.restrictionsID = UUID()
        newRestrictions?.topicLimit = topicLimit
        newRestrictions?.cardLimit = cardLimit
        save()
    }
}
