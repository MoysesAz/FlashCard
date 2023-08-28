//
//  FormTopic.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 02/06/23.
//

import SwiftUI
import Data

struct FormTopic: View {
    @ObservedObject var dataController = DataController.shared
    @State private var topicName: String = ""
    @Binding var topicSheets: TopicSheet?


    var body: some View {
        NavigationStack{
            Form {
                Section("Topic Name"){
                    TextField("Enter Name", text: $topicName)
                        .padding()
                }
            }
            .navigationTitle("Form Topic")
            .toolbar {
                Button {
                    if permissionToCreateTopic() {
                        createTopic()
                    } else {
                        topicSheets = .showingStore
                    }
                }label: {
                    Text("Save")
                }
                .disabled(topicName == "" ? true : false)
            }

        }
    }

    private func createTopic() {
        dataController.createTopic(name: topicName)
        dataController.subTopicRestrictions(number: 1)
        topicSheets = nil
    }

    private func permissionToCreateTopic() -> Bool {
        let res = dataController.getRestrictions().first
        guard let topicLimit = res?.topicLimit else {return true}
        return topicLimit > 0 ? true : false
    }
}
