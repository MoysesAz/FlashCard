//
//  Read*.swift
//  Data
//
//  Created by Moyses Miranda do Vale Azevedo on 19/07/23.
//

import CoreData

extension DataController {
    public func getTopicsByID(id: UUID) -> [Topic] {
        let predicate = NSPredicate(format: "topicID == %@", id as CVarArg)
        let featchRequest: NSFetchRequest<Topic> = Topic.fetchRequest()
        featchRequest.predicate = predicate
        do {
            let results = try container.viewContext.fetch(featchRequest)
            return results
        } catch {
            fatalError("Error in use fetch TopisByID \(error)")
        }
    }

    public func getSubTopicsByID(id: UUID) -> [SubTopic] {
        let predicate = NSPredicate(format: "subTopicID == %@", id as CVarArg)
        let featchRequest: NSFetchRequest<SubTopic> = SubTopic.fetchRequest()
        featchRequest.predicate = predicate
        do {
            let results = try container.viewContext.fetch(featchRequest)
            return results
        } catch {
            fatalError("Error in use fetch SubTopisByID \(error)")
        }
    }

    public func getCardByID(id: UUID) -> [Card] {
        let predicate = NSPredicate(format: "cardID == %@", id as CVarArg)
        let featchRequest: NSFetchRequest<Card> = Card.fetchRequest()
        featchRequest.predicate = predicate
        do {
            let results = try container.viewContext.fetch(featchRequest)
            return results
        } catch {
            fatalError("Error in use fetch CardByID \(error)")
        }
    }

}
