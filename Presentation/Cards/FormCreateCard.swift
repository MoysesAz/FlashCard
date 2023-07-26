//
//  CreateCard.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 04/06/23.
//

import SwiftUI
import Data

struct FormCreateCard: View {
    @ObservedObject var dataController = DataController.shared
    @State private var title: String = ""
    @State var content: String = ""
    @Binding var showingSheet: Bool
    @Binding var showingStore: Bool
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
                        showingSheet = false
                        showingStore = true
                        print("sem permissão")
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
        showingSheet = false
        dataController.subCardRestrictions(number: 1)
    }

    private func permissionToCreateCard() -> Bool {
        let res = dataController.getRestrictions().first
        guard let cardLimit = res?.cardLimit else {return true}
        return cardLimit > 0 ? true : false
    }
}
