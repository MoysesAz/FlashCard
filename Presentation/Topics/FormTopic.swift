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
    @Binding var showingSheet: Bool
    @State private var bgColor = Color.blue

    var body: some View {
        NavigationView {
            Form {
                Section("Topic Name"){
                    TextField("Enter Name", text: $topicName)
                        .padding()
                }
                Section("Color") {
                    ColorPicker("Enter Color", selection: $bgColor)
                        .padding()
                }
            }
            .navigationTitle("Form Topic")
            .toolbar {
                Button {
                    if permissionToCreateTopic() {
                        createTopic()
                    } else {
                        dataController.addTopicRestrictions()
                        print("ganhou um topico")
                    }
                }label: {
                    Text("Save")
                }
                .disabled(topicName == "" ? true : false)
            }
        }
    }

    private func  createTopic() {
        dataController.createTopic(name: topicName)
        showingSheet = false
        dataController.subTopicRestrictions()
    }

    private func permissionToCreateTopic() -> Bool {
        let res = dataController.getRestrictions().first
        guard let topicLimit = res?.topicLimit else {return true}
        return topicLimit > 0 ? true : false
    }
}
