//
//  SubTopicView.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 20/07/23.
//

import SwiftUI
import Data

enum SubTopicSheet: Identifiable {
    case showingSheetSubNewTopic, showingEditSubTopic
    var id: Int {
        hashValue
    }
}

struct SubTopicView: View {
    @ObservedObject var dataController = DataController.shared
    let topic: Topic
    @State private var subTopics: [SubTopic] = []
    @State private var subTopicsSheet: SubTopicSheet?
    @State private var showingAlert: Bool = false
    @State private var pointer: Int?

    var body: some View {
        NavigationStack {
            if subTopics.isEmpty {
                emptyView
            } else {
                listSubTopics
            }
        }
        .id(subTopicsSheet)
        .sheet(item: $subTopicsSheet) { item in
            switch item {
            case .showingSheetSubNewTopic:
                FormSubTopic(subTopicsSheet: $subTopicsSheet, topic: topic)
                    .presentationDetents([.medium])
            case .showingEditSubTopic:
                FormEditSubTopic(subTopicsSheet: $subTopicsSheet, colorCards: getColot(), subTopic: getSubTopic())
                    .presentationDetents([.medium])
            }
        }
    }

    var listSubTopics: some View {
        List {
            Section(topic.name) {
                ForEach(subTopics.indices, id: \.self) { index in
                    NavigationLink(subTopics[index].name,
                                   destination: CardsView(subTopic: subTopics[index])
                    )
                    .swipeActions {
                        Button("delete-string") {
                            deleteEvent(index)
                        }
                        .tint(.red)
                        Button("edit-string") {
                            editEvent(index)
                        }
                        .tint(.blue)
                    }
                }

            }
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("titleSubTopicDelete-string \(subTopics[pointer!].name)"),
                    message: Text("menssageSubTopicDelete-string"),
                    primaryButton: .destructive(Text("delete-string")) {
                        let subTopic = getSubTopic()
                        dataController.deleteSubTopic(subTopic: subTopic)
                        loadSubTopics()
                    },
                    secondaryButton: .cancel{
                        showingAlert = false
                    }
                )
            }
        }
        .onAppear {
            loadSubTopics()
        }
        .navigationTitle("subTopics-string")
        .toolbar {
            Button {
                subTopicsSheet = .showingSheetSubNewTopic
            }label: {
                Image(systemName: "plus")
            }
        }
    }

    var emptyView: some View {
        Text("emptySubTopic-string")
            .onAppear {
                loadSubTopics()
            }
            .navigationTitle("subTopics-string")
            .toolbar {
                Button {
                    subTopicsSheet = .showingSheetSubNewTopic
                }label: {
                    Image(systemName: "plus")
                }
            }

    }
}

extension SubTopicView {
    private func loadSubTopics() {
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
        subTopicsSheet = .showingEditSubTopic
    }

    private func deleteEvent(_ value: Int) {
        pointer = value
        showingAlert = true
    }
}
