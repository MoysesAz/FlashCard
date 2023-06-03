//
//  FormCardTitle.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 03/06/23.
//

import SwiftUI

struct FormcCard: View {
    @FetchRequest(sortDescriptors: []) var topics: FetchedResults<Topic>
    @Environment(\.managedObjectContext) var moc

    @State private var topicName: String = ""
    @Binding var showingSheetFormCard: Bool


    var body: some View {
        VStack {
            Form {
                TextField("Placeholder", text: $topicName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top, 100)
                TextEditor(text: $topicName)
            }

            Spacer()
            Button {
                let newTopic = Topic(context: moc)
                newTopic.id = UUID()
                newTopic.name = topicName
                do {
                    try moc.save()
                    showingSheetFormCard = false
                } catch {
                    print(error)
                }
            } label: {
                HStack {
                    Text("Send")
                }
                .fixedSize()
            }
            .disabled(topicName == "" ? true : false)
            .buttonStyle(.borderedProminent)
        }
    }

}


