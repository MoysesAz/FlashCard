//
//  FormCardTitle.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 03/06/23.
//

import SwiftUI
import Data

struct FormEditCard: View {
    @Environment(\.managedObjectContext) var moc
    var card: Card
    @Binding var title: String
    @Binding var content: String
    @Binding var showingSheet: Bool
    @State var title1: String = "title"
    @State var content1: String = "content"

    var body: some View {
        NavigationView {
            Form {
                Section("Title Card"){
                    TextField("Title Card", text: $title1)
                }
                Section("Content Card") {
                    TextEditor(text: $content1)
                        .frame(height: 100)
                }
            }
            .onAppear {
                title1 = card.title!
                content1 = card.content!
            }
            .navigationTitle("Form Card")
            .toolbar {
                Button {
                    card.title = title1
                    card.content = content1
                    title = title1
                    content = content1
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


