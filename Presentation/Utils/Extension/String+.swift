//
//  String+.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 26/07/23.
//

import Foundation

extension String {
    func decodeCGFloatList() -> [Double]? {
        guard let jsonData = self.data(using: .utf8) else {
            print("Erro ao converter a string para dados.")
            return nil
        }

        do {
            let doubleList = try JSONDecoder().decode([Double].self, from: jsonData)
            return doubleList
        } catch {
            print("Erro ao decodificar a string: \(error)")
            return nil
        }
    }
}



