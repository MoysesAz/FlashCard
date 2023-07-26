//
//  Restrictions*.swift
//  Data
//
//  Created by Moyses Miranda do Vale Azevedo on 21/07/23.
//

import Foundation

extension DataController {
    public func addTopicRestrictions(number: Int16) {
        let newRestrictions = getRestrictions().first
        newRestrictions?.topicLimit += 1
        save()
    }

    public func subTopicRestrictions(number: Int16) {
        let newRestrictions = getRestrictions().first
        newRestrictions?.topicLimit -= 1
        save()
    }

    public func addCardRestrictions(number: Int16) {
        let newRestrictions = getRestrictions().first
        newRestrictions?.cardLimit += number
        save()
    }

    public func subCardRestrictions(number: Int16) {
        let newRestrictions = getRestrictions().first
        newRestrictions?.cardLimit -= number
        save()
    }
}
