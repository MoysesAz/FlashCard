//
//  SubTopicForms.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 20/07/23.
//

import SwiftUI
import Data

struct FormSubTopic: View {
    @ObservedObject var dataController = DataController.shared
    @State private var subTopicName: String = ""
    @Binding var showingSheet: Bool
    @State private var bgColor = Color.blue
    let topic: Topic

    var body: some View {
        NavigationView {
            Form {
                Section("SubTopic Name"){
                    TextField("Enter Name", text: $subTopicName)
                        .padding()
                }
                Section("Color") {
                    ColorPicker("Enter Color", selection: $bgColor)
                        .padding()
                }
            }
            .navigationTitle("Form SubTopic")
            .toolbar {
                Button {
                    dataController.createCreateSubTopic(name: subTopicName, topic: topic)
                    showingSheet = false
                }label: {
                    Text("Save")
                }
                .disabled(subTopicName == "" ? true : false)
            }
        }
    }
}
