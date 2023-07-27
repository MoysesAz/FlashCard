//
//  FormEditSubTopic.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 26/07/23.
//

import SwiftUI
import Data

struct FormEditSubTopic: View {
    @ObservedObject var dataController = DataController.shared
    @State private var subTopicName: String = ""
    @Binding var showingSheet: Bool
    @State private var bgColor = Color.blue
    let subTopic: SubTopic

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
                    let colorInString = bgColor.cgColor?.components?.encodeToString()
                    guard let colorInStringNoNil = colorInString else { return }
                    dataController.uploadSubTopic(id: subTopic.subTopicsID, name: subTopicName, color: colorInStringNoNil)
                    showingSheet = false
                }label: {
                    Text("Save")
                }
                .disabled(subTopicName == "" ? true : false)
            }
        }
        .onAppear {
            subTopicName = subTopic.name
        }
    }
}
