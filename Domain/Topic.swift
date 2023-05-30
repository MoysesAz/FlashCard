//
//  Topic.swift
//  Domain
//
//  Created by Moyses Miranda do Vale Azevedo on 29/05/23.
//

import Foundation

public struct Topic {
    public let id: String
    public var name: String
    public var cards: [Card]

    public init(_ id: String, name: String, cards: [Card]) {
        self.id = id
        self.name = name
        self.cards = cards
    }
}
