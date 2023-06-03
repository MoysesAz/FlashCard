//
//  FormTopic.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 02/06/23.
//

import SwiftUI

struct FormTopic: View {
    @FetchRequest(sortDescriptors: []) var topics: FetchedResults<Topic>
    @Environment(\.managedObjectContext) var moc

    @State private var topicName: String = ""
    @Binding var showingSheet: Bool
    @State private var bgColor = Color.blue

    var body: some View {
        NavigationView {
            Form {
                Section("Topic Information"){
                    TextField("Topic Name", text: $topicName)
                        .padding()
                    ColorPicker("Set color", selection: $bgColor)
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
