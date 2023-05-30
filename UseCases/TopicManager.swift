//
//  TopicManager.swift
//  UseCases
//
//  Created by Moyses Miranda do Vale Azevedo on 29/05/23.
//

import Foundation
import Domain

public class TopicManager: AddTopicProtocol, DeleteTopicProtocol, AddCardProtocol, DeleteCardProtocol {
    private var _topics: [Topic] = []
    public var topics: [Topic] {
        get { return _topics }
        set { _ = newValue }
    }

    public var pointerTopic: Int = 0

    public func addCard(tittle: String, description: String) throws {
        try verifyTopic()
        let newCard = Card(UUID().uuidString, tittle: tittle, description: description)
        _topics[pointerTopic].cards.append(newCard)
    }

    public func addCard(tittle: String, imageData: Data) throws {
        try verifyTopic()
        let newCard = Card(UUID().uuidString, tittle: tittle, image: imageData)
        _topics[pointerTopic].cards.append(newCard)
    }

    public func deleteCard(index: Int) throws {
        try verifyTopic()
        try verifyCard(cardIndex: index)
        _topics[pointerTopic].cards.remove(at: index)
    }

    public func addTopic(name: String) {
        let newTopic = Topic(UUID().uuidString, name: name, cards: [])
        _topics.append(newTopic)
    }

    public func deleteTopic(index: Int) throws {
        try verifyTopic()
        _topics.remove(at: index)
    }

    private func verifyTopic() throws {
        guard _topics.isEmpty else {
            throw TopicManagerError.topicIsEmpty
        }
        guard pointerTopic > _topics.count || pointerTopic < 0 else {
            throw TopicManagerError.indexNotCompatibleWithTopic
        }
    }

    private func verifyCard(cardIndex: Int) throws {
        guard _topics[pointerTopic].cards.isEmpty else {
            throw TopicManagerError.cardsIsEmpty
        }
        guard cardIndex > _topics[pointerTopic].cards.count || cardIndex < 0 else {
            throw TopicManagerError.indexNotCompatibleWithCards
        }
    }
}
