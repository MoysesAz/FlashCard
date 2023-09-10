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
    @Binding var subTopicsSheet: SubTopicSheet?
    @State private var colorCards: Color = Color(red: 0.2, green: 0.42, blue: 0.87)
    let topic: Topic

    var body: some View {
        NavigationView {
            Form {
                Section("subTopicName-string"){
                    TextField("enterName-string", text: $subTopicName)
                        .padding()
                }
                Section("color-string") {
                    ColorPicker("enterColor-string", selection: $colorCards)
                        .padding()
                }
            }
            .navigationTitle("subTopicform-string")
            .toolbar {
                Button {
                    saveEvent()
                }label: {
                    Text("save-string")
                }
                .disabled(stateButtonSave())
            }
        }
    }
}

extension FormSubTopic {
    private func saveEvent() {
        let color = colorCards.cgColor?.components?.encodeToString()
        guard let colorInString = color else { return }
        dataController.createCreateSubTopic(name: subTopicName, topic: topic, color: colorInString)
        subTopicsSheet = nil
    }

    private func stateButtonSave() -> Bool {
        subTopicName == "" ? true : false
    }
}
