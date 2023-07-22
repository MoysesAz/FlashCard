//
//  ListSubTopic.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 20/07/23.
//


import SwiftUI
import Data

struct ListSubTopics: View {
    @ObservedObject var dataController = DataController.shared
    @State var subTopics: [SubTopic] = []
    @State private var showingAlert = false
    @State private var toBeDeleted: Int?
    var topic: Topic

    var body: some View {
        VStack {
            List {
                ForEach(subTopics, id: \.self) { subTopic in
                    NavigationLink(subTopic.name,
                                   destination: CardsView(subTopic: subTopic)
                    )
                }
                .onDelete { subTopic in
                    showingAlert = true
                    toBeDeleted = subTopic.first!
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Are you sure you want to delete this topic?"),
                        message: Text("O que devo escrever aqui!!!!"),
                        primaryButton: .destructive(Text("Delete")) {
                            guard let indexSubTopic = toBeDeleted  else { return }
                            let subTopic = subTopics[indexSubTopic]
                            subTopics.remove(at: indexSubTopic)
                            dataController.deleteSubTopic(subTopic: subTopic)

                        },
                        secondaryButton: .cancel{
                            showingAlert = false
                        }
                    )
                }
            }
        }
        .onAppear {
            let array = topic.subTopics?.allObjects as! [SubTopic]
            subTopics = array
        }
    }
}
