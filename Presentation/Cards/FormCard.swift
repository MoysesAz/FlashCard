//
//  FormCardTitle.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 03/06/23.
//

import SwiftUI

struct FormCard: View {
    @FetchRequest(sortDescriptors: []) var topics: FetchedResults<Topic>
    @Environment(\.managedObjectContext) var moc

    @State private var title: String = ""
    @State var content: String = "Content Card"
    @State var showingSheet: Bool

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
                    let newTopic = Topic(context: moc)
                    newTopic.id = UUID()
                    newTopic.name = title
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


