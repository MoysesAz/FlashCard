//
//  Card.swift
//  Domain
//
//  Created by Moyses Miranda do Vale Azevedo on 29/05/23.
//

import Foundation

public struct Card {
    public let id: String
    public var tittle: String
    public var description: String?
    public var image: Data?

    public init(_ id: String, tittle: String, description: String? = nil, image: Data? = nil) {
        self.id = id
        self.tittle = tittle
        self.description = description
        self.image = image
    }
}
