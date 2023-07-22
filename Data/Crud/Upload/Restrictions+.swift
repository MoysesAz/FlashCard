//
//  Restrictions*.swift
//  Data
//
//  Created by Moyses Miranda do Vale Azevedo on 21/07/23.
//

import Foundation

extension DataController {
    public func addTopicRestrictions() {
        let newRestrictions = getRestrictions().first
        newRestrictions?.topicLimit += 1
        save()
    }

    public func subTopicRestrictions() {
        let newRestrictions = getRestrictions().first
        newRestrictions?.topicLimit -= 1
        save()
    }

    public func addCardRestrictions() {
        let newRestrictions = getRestrictions().first
        newRestrictions?.cardLimit += 1
        save()
    }

    public func subCardRestrictions() {
        let newRestrictions = getRestrictions().first
        newRestrictions?.cardLimit -= 1
        save()
    }
}
