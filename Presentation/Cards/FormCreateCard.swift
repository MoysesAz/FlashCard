//
//  CreateCard.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 04/06/23.
//

import SwiftUI

struct FormCreateCard: View {
    @FetchRequest(sortDescriptors: []) var card: FetchedResults<Card>
    @Environment(\.managedObjectContext) var moc

    @State private var title: String = ""
    @State var content: String = "Content Card"
    @Binding var showingSheet: Bool
    var topic: Topic

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
                    let newCard = Card(context: moc)
                    newCard.relationship = topic
                    newCard.id = UUID()
                    newCard.title = title
                    newCard.content = content
                    do {
                        try moc.save()
                        showingSheet = false
                    } catch {
                        print(error)
                    }
                }label: {
                    Text("Save")
                }
                .disabled(title == "" ? true : false)
            }
        }
    }
}
