//
//  AddCardsProtocol.swift
//  UseCases
//
//  Created by Moyses Miranda do Vale Azevedo on 29/05/23.
//

import Foundation

protocol AddCardProtocol {
    func addCard(tittle: String, description: String) throws
    func addCard(tittle: String, imageData: Data) throws
}
