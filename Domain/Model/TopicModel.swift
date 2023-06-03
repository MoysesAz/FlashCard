//
//  TopicModel.swift
//  Domain
//
//  Created by Moyses Miranda do Vale Azevedo on 01/06/23.
//

import Foundation

public struct TopicModel {
    public init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }

    var id: UUID
    var name: String
}
