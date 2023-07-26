//
//  CGFloat.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 26/07/23.
//

import Foundation

extension [CGFloat] {
    func encodeToString() -> String? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            print("Erro ao codificar a lista: \(error)")
            return nil
        }
    }

}


