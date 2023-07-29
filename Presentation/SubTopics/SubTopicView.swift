//
//  SubTopicView.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 20/07/23.
//

import SwiftUI
import Data

struct SubTopicView: View {
    @ObservedObject var dataController = DataController.shared
    let topic: Topic
    @State private var subTopics: [SubTopic] = []
    @State private var showingCreate: Bool = false
    @State private var showingAlert: Bool = false
    @State private var showingEdit: Bool = false
    @State private var pointer: Int?

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(subTopics.indices, id: \.self) { index in
                        NavigationLink(subTopics[index].name,
                                       destination: CardsView(subTopic: subTopics[index])
                        )
                        .swipeActions {
                            Button("Delete") {
                                deleteEvent(index)

                            }
                            .tint(.red)
                            Button("Edit") {
                                editEvent(index)
                            }
                            .tint(.yellow)
                        }
                    }

                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Are you sure you want to delete this topic?"),
                        message: Text("O que devo escrever aqui!!!!"),
                        primaryButton: .destructive(Text("Delete")) {
                            subTopics.remove(at: pointer ?? -1)
                            dataController.deleteSubTopic(subTopic: getSubTopic())
                        },
                        secondaryButton: .cancel{
                            showingAlert = false
                        }
                    )
                }
                .sheet(isPresented: $showingEdit) {
                    FormEditSubTopic(showingSheet: $showingEdit, colorCards: getColot(), subTopic: getSubTopic())
                }
            }
            .onAppear {
                loadTopics()
            }

            .navigationTitle("SubTopics")
            .toolbar {
                Button {
                    showingCreate.toggle()
                }label: {
                    Image(systemName: "plus")
                }
            }
        }
        .id(showingCreate)
        .sheet(isPresented: $showingCreate) {
            FormSubTopic(showingSheet: $showingCreate, topic: topic)
        }
    }
}

extension SubTopicView {
    private func loadTopics() {
        let array = topic.subTopics?.allObjects as! [SubTopic]
        subTopics = array
    }

    private func getColot() -> Color {
        let subTopic = subTopics[pointer ?? 0]
        let listValues = subTopic.color.decodeCGFloatList() ?? []
        let color = Color(red: listValues[0], green: listValues[1], blue: listValues[2], opacity: listValues[3])
        return color
    }

    private func getSubTopic() -> SubTopic {
        return subTopics[pointer ?? 0]
    }

    private func editEvent(_ value: Int) {
        pointer = value
        showingEdit = true
    }

    private func deleteEvent(_ value: Int) {
        pointer = value
        showingEdit = true
    }
}
