//
//  ListTopics.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 02/06/23.
//

import SwiftUI

struct ListTopics: View {
    @FetchRequest(sortDescriptors: []) var topics: FetchedResults<Topic>
    @Environment(\.managedObjectContext) var moc
    @State private var showingAlert = false
    @State private var toBeDeleted: Int?
    
    var body: some View {
        List {
            ForEach(topics, id: \.self) { topic in
                NavigationLink(topic.name ?? "Nil",
                               destination: CardView()
                )
            }
            .onDelete { topic in
                showingAlert = true
                toBeDeleted = topic.first
            }
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Are you sure you want to delete this topic?"),
                    message: Text("O que devo escrever aqui!!!!"),
                    primaryButton: .destructive(Text("Delete")) {
                        guard let indexTopic = toBeDeleted  else { return }
                        moc.delete(topics[indexTopic])
                        try? moc.save()
                    },
                    secondaryButton: .cancel{
                        showingAlert = false
                    }
                )
            }
        }
    }
}
