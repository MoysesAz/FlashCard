//
//  Card.swift
//  Domain
//
//  Created by Moyses Miranda do Vale Azevedo on 29/05/23.
//

import Foundation

protocol addTopic {
    func add(addTopicName: addTopicModel, completion: @escaping (Result<TopicModel, Error>) -> Void)
}

struct addTopicModel {
    var id: UUID
    var name: String
}
