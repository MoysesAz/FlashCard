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
    @Binding var subTopicsSheet: SubTopicSheet?
    @State var colorCards: Color
    let subTopic: SubTopic

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
                    let colorInString = colorCards.cgColor?.components?.encodeToString()
                    guard let colorInStringNoNil = colorInString else { return }
                    dataController.uploadSubTopic(id: subTopic.subTopicsID, name: subTopicName, color: colorInStringNoNil)
                    subTopicsSheet = nil
                }label: {
                    Text("save-string")
                }
                .disabled(subTopicName == "" ? true : false)
            }
        }
        .onAppear {
            subTopicName = subTopic.name
        }
    }
}
