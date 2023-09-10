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
    @Binding var stateSheet: StateSheet?
    @Binding var cache: String


    var body: some View {
        NavigationStack{
            Form {
                Section("topicName-string"){
                    TextField("enterName-string", text: $topicName)
                        .padding()
                }
            }
            .navigationTitle("topicform-string")
            .toolbar {
                Button {
                    if permissionToCreateTopic() {
                        createTopic()
                    } else {
                        openStory()
                    }
                }label: {
                    Text("save-string")
                }
                .disabled(topicName == "" ? true : false)
            }

        }
        .onAppear {
            verifyCache()
        }
    }
}

extension FormTopic {
    private func createTopic() {
        cache = ""
        dataController.createTopic(name: topicName)
        dataController.subTopicRestrictions(number: 1)
        stateSheet = nil
    }

    private func permissionToCreateTopic() -> Bool {
        let res = dataController.getRestrictions().first
        guard let topicLimit = res?.topicLimit else {return true}
        return topicLimit > 0 ? true : false
    }

    private func openStory() {
        stateSheet = .showingStore
        cache = topicName
    }

    private func verifyCache() {
        if !cache.isEmpty {
            topicName = cache
        }
    }
}
