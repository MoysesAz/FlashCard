//
//  TopicManager.swift
//  UseCases
//
//  Created by Moyses Miranda do Vale Azevedo on 29/05/23.
//

import Foundation
import Domain

public class TopicManager: AddTopicProtocol, DeleteTopicProtocol, AddCardProtocol, DeleteCardProtocol {
    public var pointerTopic: Int = 0
    private var _topics: [Topic] = []
    public var topics: [Topic] {
        get { return _topics }
        set { _ = newValue }
    }

    public func addCard(title: String, description: String) throws {
        try verifyTopic()
        let newCard = Card(UUID().uuidString, title: title, description: description)
        _topics[pointerTopic].cards.append(newCard)
    }

    public func addCard(title: String, imageData: Data) throws {
        try verifyTopic()
        let newCard = Card(UUID().uuidString, title: title, image: imageData)
        _topics[pointerTopic].cards.append(newCard)
    }

    public func deleteCard(indexCard: Int) throws {
        try verifyTopic()
        try verifyCard(cardIndex: indexCard)
        _topics[pointerTopic].cards.remove(at: indexCard)
    }

    public func addTopic(name: String) {
        let newTopic = Topic(UUID().uuidString, name: name, cards: [])
        _topics.append(newTopic)
    }

    public func deleteTopic(indexTopic: Int) throws {
        try verifyTopic()
        _topics.remove(at: indexTopic)
    }

    private func verifyTopic() throws {
        guard !_topics.isEmpty else {
            throw TopicManagerError.topicIsEmpty
        }
        guard pointerTopic < _topics.count || pointerTopic > 0 else {
            print(pointerTopic, _topics.count)
            throw TopicManagerError.indexNotCompatibleWithTopic
        }
    }

    private func verifyCard(cardIndex: Int) throws {
        guard !_topics[pointerTopic].cards.isEmpty else {
            throw TopicManagerError.cardsIsEmpty
        }
        guard cardIndex < _topics[pointerTopic].cards.count || cardIndex > 0 else {
            throw TopicManagerError.indexNotCompatibleWithCards
        }
    }
}
