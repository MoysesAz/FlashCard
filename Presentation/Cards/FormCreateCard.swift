//
//  CreateCard.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 04/06/23.
//

import SwiftUI
import Data

struct FormCreateCard: View {
    @Binding var stateSheet: StateSheet?
    @ObservedObject var dataController = DataController.shared
    @State private var title: String = ""
    @State var content: String = ""
    var subTopic: SubTopic


    var body: some View {
        NavigationView {
            Form {
                Section("Title Card"){
                    TextField("Title Card", text: $title)
                }
                Section("Content Card") {
                    TextEditor(text: $content)
                        .frame(height: 100)
                }
            }
            .navigationTitle("Form Card")
            .toolbar {
                Button {
                    if permissionToCreateCard() {
                        createCard()
                    } else {
                        stateSheet = .showingStore
                    }

                }label: {
                    Text("Save")
                }
                .disabled(title == "" ? true : false)
            }
        }
    }

    private func  createCard() {
        dataController.createCreateCard(title: title, content: content, subTopic: subTopic)
        dataController.subCardRestrictions(number: 1)
        stateSheet = nil
    }

    private func permissionToCreateCard() -> Bool {
        let res = dataController.getRestrictions().first
        guard let cardLimit = res?.cardLimit else {return true}
        return cardLimit > 0 ? true : false
    }
}
