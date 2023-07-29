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
    @Binding var showingSheet: Bool
    let topic: Topic

    var body: some View {
        NavigationView {
            Form {
                Section("Topic Name"){
                    TextField("Enter Name", text: $topicName)
                        .padding()
                }
            }
            .navigationTitle("Form Topic")
            .toolbar {
                Button {
                    saveEvent()
                }label: {
                    Text("Save")
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
        showingSheet = false
    }
}
