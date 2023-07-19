//
//  ListTopics.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 02/06/23.
//

import SwiftUI
import Data

struct ListTopics: View {
    @ObservedObject var dataController = DataController.shared
    @State var topics: [Topic] = []
    @State private var showingAlert = false
    @State private var toBeDeleted: Int?
    
    var body: some View {
        VStack {
            List {
                ForEach(topics, id: \.self) { topic in
                    NavigationLink(topic.name,
                                   destination: ListCards(topic: topic)
                    )
                }
                .onDelete { topic in
                    showingAlert = true
                    toBeDeleted = topic.first!
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Are you sure you want to delete this topic?"),
                        message: Text("O que devo escrever aqui!!!!"),
                        primaryButton: .destructive(Text("Delete")) {
                            guard let indexTopic = toBeDeleted  else { return }
                            let topicID = topics[indexTopic].topicID
                            topics.remove(at: indexTopic)
                            dataController.deleteTopicByID(id: topicID)
                        },
                        secondaryButton: .cancel{
                            showingAlert = false
                        }
                    )
                }
            }
        }
        .onAppear {
            topics = dataController.getTopics()
        }
    }
}
