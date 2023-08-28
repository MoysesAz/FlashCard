//
//  ContentView.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 01/06/23.
//

import SwiftUI
import UIKit
import GoogleMobileAds
import Data

enum TopicSheet: Identifiable {
    case showingSheetNewTopic, showingEdit, showingStore
    var id: Int {
        hashValue
    }
}

struct TopicView: View {
    @ObservedObject var dataController = DataController.shared
    @State private var topics: [Topic] = []
    @State var topicSheet: TopicSheet?
    @State private var showingAlert: Bool = false
    @State private var pointer: Int?

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(topics.indices, id: \.self) { index in
                        NavigationLink(topics[index].name,
                                       destination: SubTopicView(topic: topics[index])
                        )
                        .swipeActions {
                            Button("Delete") {
                                deleteEvent(index)
                            }
                            .tint(.red)
                            Button("Edit") {
                                editEvent(index)
                            }
                            .tint(.blue)
                        }
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Are you sure you want to delete this topic?"),
                            message: Text("O que devo escrever aqui!!!!"),
                            primaryButton: .destructive(Text("Delete")) {
                                let topic = getTopic()
                                dataController.deleteTopic(topic: topic)
                                loadTopics()
                            },
                            secondaryButton: .cancel{
                                showingAlert = false
                            }
                        )
                    }
                }
            }
            .onAppear {
                verification()
                loadTopics()
            }
            .navigationTitle("Topics")
            .toolbar {
                Button {
                    topicSheet = .showingSheetNewTopic
                }label: {
                    Image(systemName: "plus")
                }
            }
        }
        .id(topicSheet)
        .sheet(item: $topicSheet) { item in
            switch item {
            case .showingSheetNewTopic:
                FormTopic(topicSheets: $topicSheet)
            case .showingStore:
                StoreView(topicSheet: $topicSheet)
            case .showingEdit:
                FormEditTopic(topicSheet: $topicSheet, topic: getTopic())
            }
        }
    }
}

extension TopicView {
    private func verification() {
        let restrictions = dataController.getRestrictions()
        if restrictions.count == 0 {
            dataController.createRestrictions(topicLimit: 3, cardLimit: 10)
        }
    }

    private func editEvent(_ value: Int) {
        pointer = value
        topicSheet = .showingEdit
    }

    private func deleteEvent(_ value: Int) {
        pointer = value
        showingAlert = true
    }

    private func loadTopics() {
        topics = dataController.getTopics()
    }

    private func getTopic() -> Topic {
        return topics[pointer ?? 0]
    }
}

