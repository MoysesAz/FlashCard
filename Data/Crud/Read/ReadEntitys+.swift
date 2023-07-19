//
//  ReadEntitys+.swift
//  Data
//
//  Created by Moyses Miranda do Vale Azevedo on 19/07/23.
//

import CoreData

extension DataController {
    public func getTopics() -> [Topic] {
        let featchRequest: NSFetchRequest<Topic> = Topic.fetchRequest()
        do {
            let results = try container.viewContext.fetch(featchRequest)
            return results
        } catch {
            fatalError("Error in use fetch Topis \(error)")
        }
    }

    public func getSubTopics() -> [SubTopic] {
        let featchRequest: NSFetchRequest<SubTopic> = SubTopic.fetchRequest()
        do {
            let results = try container.viewContext.fetch(featchRequest)
            return results
        } catch {
            fatalError("Error in use fetch SubTopics \(error)")
        }
    }

    public func getCards() -> [Card] {
        let featchRequest: NSFetchRequest<Card> = Card.fetchRequest()
        do {
            let results = try container.viewContext.fetch(featchRequest)
            return results
        } catch {
            fatalError("Error in use fetch Cards \(error)")
        }
    }
}
