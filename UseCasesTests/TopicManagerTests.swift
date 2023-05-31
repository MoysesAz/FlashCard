//
//  UseCasesTests.swift
//  UseCasesTests
//
//  Created by Moyses Miranda do Vale Azevedo on 29/05/23.
//

import XCTest
import Domain
@testable import UseCases

class TopicManagerTests: XCTestCase {
    var sut: TopicManager!

    override func setUpWithError() throws {
        sut = TopicManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func teste_addTopic() {
        let nameTopic = "Solid"

        sut.addTopic(name: nameTopic)
        let result = sut.topics.count
        XCTAssertEqual(result, 1)
    }

    func teste_addTopic_values() {
        let nameTopic = "Solid"

        sut.addTopic(name: nameTopic)
        let result = sut.topics
        XCTAssertEqual(result.count, 1)
    }

    func teste_deleteTopic() {
        sut.addTopic(name: "Solid")

        do {
            try sut.deleteTopic(indexTopic: 0)
        } catch {
            XCTFail("Erro inesperado: \(error)")
        }

        let result = sut.topics.count
        XCTAssertEqual(result, 0)
    }

    func teste_addCardWithDescription() {
        sut.addTopic(name: "Solid")
        sut.pointerTopic = 0

        do {
            try sut.addCard(title: "Formula da energia", description: "E = mcˆ2")
        } catch {
            XCTFail("Erro inesperado: \(error)")
        }
        let result = sut.topics[0].cards.count
        XCTAssertEqual(result, 1)
    }

    func teste_addCardWithData() {
        sut.addTopic(name: "Solid")
        sut.pointerTopic = 0

        do {
            try sut.addCard(title: "Formula da energia", imageData: Data())
        } catch {
            XCTFail("Erro inesperado: \(error)")
        }
        let result = sut.topics[0].cards.count
        XCTAssertEqual(result, 1)
    }

    func teste_DeleteCard() {
        sut.addTopic(name: "Solid")
        sut.pointerTopic = 0

        do {
            try sut.addCard(title: "Formula da energia", imageData: Data())
            try sut.deleteCard(indexCard: 0)
        } catch {
            XCTFail("Erro inesperado: \(error)")
        }
        let result = sut.topics[0].cards.count
        XCTAssertEqual(result, 0)
    }
}
