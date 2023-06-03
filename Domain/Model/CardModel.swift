//
//  CardModel.swift
//  Domain
//
//  Created by Moyses Miranda do Vale Azevedo on 03/06/23.
//

import Foundation

public struct CardModel {
    public init(id: UUID, title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
    
    var id: UUID
    var title: String
    var content: String
}
