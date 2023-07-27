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
    @State private var showingAlert: Bool = false
    @State private var showingEdit: Bool = false
    @State private var pointer: Int?
    var topic: Topic

    var body: some View {
        VStack {
            List {
                ForEach(subTopics.indices, id: \.self) { index in
                    NavigationLink(subTopics[index].name,
                                   destination: CardsView(subTopic: subTopics[index])

                    )
                    .swipeActions {
                        Button("Delete") {
                            pointer = index
                            showingAlert = true
                        }
                        .tint(.red)
                        Button("Edit") {
                            pointer = index
                            showingEdit = true
                        }
                        .tint(.yellow)
                    }
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Are you sure you want to delete this topic?"),
                        message: Text("O que devo escrever aqui!!!!"),
                        primaryButton: .destructive(Text("Delete")) {
                            let subTopic = subTopics[pointer ?? 0]
                            subTopics.remove(at: pointer!)
                            dataController.deleteSubTopic(subTopic: subTopic)
                        },
                        secondaryButton: .cancel{
                            showingAlert = false
                        }
                    )
                }
            }
            .sheet(isPresented: $showingEdit) {
                FormEditSubTopic(showingSheet: $showingEdit, subTopic: subTopics[pointer ?? 0])
            }

        }
        .onAppear {
            let array = topic.subTopics?.allObjects as! [SubTopic]
            subTopics = array
        }

    }
}
