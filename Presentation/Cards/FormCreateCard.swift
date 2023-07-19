//
//  CreateCard.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 04/06/23.
//

import SwiftUI

struct FormCreateCard: View {
    @Environment(\.managedObjectContext) var moc

    @State private var title: String = ""
    @State var content: String = "Content Card"
    @Binding var showingSheet: Bool

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
                    
                }label: {
                    Text("Save")
                }
                .disabled(title == "" ? true : false)
            }
        }
    }
}
