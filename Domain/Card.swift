//
//  Card.swift
//  Domain
//
//  Created by Moyses Miranda do Vale Azevedo on 29/05/23.
//

import Foundation

public struct Card {
    let id: String
    var tittle: String
    var description: String?
    var image: Data?

    public init(_ id: String, tittle: String, description: String, image: Data) {
        self.id = id
        self.tittle = tittle
        self.description = description
        self.image = image
    }
}
