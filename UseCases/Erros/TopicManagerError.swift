//
//  TopicManagerError.swift
//  UseCases
//
//  Created by Moyses Miranda do Vale Azevedo on 30/05/23.
//

import Foundation

enum TopicManagerError: Error {
    case indexNotCompatibleWithTopic
    case negativeIndex
    case topicIsEmpty
    case cardsIsEmpty
    case indexNotCompatibleWithCards
}
