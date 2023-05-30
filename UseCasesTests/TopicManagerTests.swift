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
        sut.addTopic(name: "topico 1")
        let result = sut.topics.count
        XCTAssertEqual(result, 1, "Era esperado existir 1 item na lista")
    }
}
