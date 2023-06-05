//
//  FormTopic.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 02/06/23.
//

import SwiftUI
import Data

struct FormTopic: View {
    @FetchRequest(sortDescriptors: []) var topics: FetchedResults<Topic>
    @Environment(\.managedObjectContext) var moc

    @State private var topicName: String = ""
    @Binding var showingSheet: Bool
    @State private var bgColor = Color.blue

    var body: some View {
        NavigationView {
            Form {
                Section("Topic Name"){
                    TextField("Enter Name", text: $topicName)
                        .padding()
                }
                Section("Color") {
                    ColorPicker("Enter Color", selection: $bgColor)
                        .padding()
                }
            }
            .navigationTitle("Form Topic")
            .toolbar {
                Button {
                    let newTopic = Topic(context: moc)
                    newTopic.id = UUID()
                    newTopic.name = topicName
                    do {
                        try moc.save()
                        showingSheet = false
                    } catch {
                        print(error)
                    }
                }label: {
                    Text("Save")
                }
                .disabled(topicName == "" ? true : false)
            }
        }

    }
    
}
