//
//  UseCasesTests.swift
//  UseCasesTests
//
//  Created by Moyses Miranda do Vale Azevedo on 29/05/23.
//

import XCTest
@testable import UseCases

class TopicManagerTests: XCTestCase {
    func teste_addTopic() {
        let sut = TopicManager()
        sut.addTopic(name: "Solid")
        let result = sut.topics.count
        XCTAssertEqual(result, 1)
    }

    func teste_deleteTopic() {
        let sut = TopicManager()
        sut.addTopic(name: "Solid")

        do {
            try sut.deleteTopic(indexTopic: 0)
        } catch {
            XCTFail("Erro inesperado: \(error)")
        }

        let result = sut.topics.count
        XCTAssertEqual(result, 0)
    }
}
