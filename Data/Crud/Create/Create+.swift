//
//  Create+.swift
//  Data
//
//  Created by Moyses Miranda do Vale Azevedo on 19/07/23.
//

import Foundation

extension DataController {
    public func createTopic(name: String) {
        let newTopic = Topic(context: container.viewContext)
        newTopic.topicID = UUID()
        newTopic.creationDate = Date()
        newTopic.name = name
        save()
    }

    public func createCreateSubTopic(name: String) {
        let newSubTopic = SubTopic(context: container.viewContext)
        newSubTopic.subTopicsID = UUID()
        newSubTopic.creationDate = Date()
        newSubTopic.name = name
        save()
    }

    public func createCreateCard(title: String, content: String) {
        let newCard = Card(context: container.viewContext)
        newCard.cardID = UUID()
        newCard.creationDate = Date()
        newCard.title = title
        newCard.content = content
        save()
    }
}
