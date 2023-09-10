//
//  FormEditTopic.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 29/07/23.
//

import SwiftUI
import Data

struct FormEditTopic: View {
    @ObservedObject var dataController = DataController.shared
    @State private var topicName: String = ""
    @Binding var stateSheet: StateSheet?
    let topic: Topic

    var body: some View {
        NavigationView {
            Form {
                Section("topicName-string"){
                    TextField("enterName-string", text: $topicName)
                        .padding()
                }
            }
            .navigationTitle("topicform-string")
            .toolbar {
                Button {
                    saveEvent()
                }label: {
                    Text("save-string")
                }
                .disabled(topicName == "" ? true : false)
            }
        }
        .onAppear {
            topicName = topic.name
        }
    }
}

extension FormEditTopic {
    private func saveEvent() {
        dataController.uploadTopic(id: topic.topicID, name: topicName)
        stateSheet = nil
    }
}
