//
//  TopicManager.swift
//  UseCases
//
//  Created by Moyses Miranda do Vale Azevedo on 29/05/23.
//

import Foundation
import Domain

public class TopicManager: AddTopicProtocol, DeleteTopicProtocol, AddCardProtocol, DeleteCardProtocol {
    private var topics: [Topic] = []
    private var pointerTopic: Int = 0

    public func addCard(tittle: String, description: String) {
        let newCard = Card(UUID().uuidString, tittle: tittle, description: description)
        topics[pointerTopic].cards.append(newCard)
    }

    public func addCard(tittle: String, imageData: Data) {
        let newCard = Card(UUID().uuidString, tittle: tittle, image: imageData)
        topics[pointerTopic].cards.append(newCard)
    }

    public func deleteCardProtocol(index: Int) {
        topics[pointerTopic].cards.remove(at: index)
    }

    public func addTopic(name: String) {
        let newTopic = Topic(UUID().uuidString, name: name, cards: [])
        topics.append(newTopic)
    }

    public func deleteTopic(index: Int) {
        topics.remove(at: index)
    }


}
