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

enum StateSheet: Identifiable {
    case showingCreating, showingEdit, showingStore
    var id: Int {
        hashValue
    }
}


struct TopicView: View {
    @ObservedObject var dataController = DataController.shared
    @State private var topics: [Topic] = []
    @State var stateSheet: StateSheet?
    @State private var showingAlert: Bool = false
    @State private var pointer: Int?

    var body: some View {
        NavigationStack {
            if topics.isEmpty {
                emptyView
            } else {
                listTopics
            }
        }
        .id(stateSheet)
        .onAppear {
            verification()
        }
        .sheet(item: $stateSheet) { item in
            switch item {
            case .showingCreating:
                FormTopic(stateSheet: $stateSheet)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            case .showingStore:
                StoreView(stateSheet: $stateSheet)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            case .showingEdit:
                FormEditTopic(stateSheet: $stateSheet, topic: getTopic())
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
    }

    var listTopics: some View {
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
                    title: Text("Are you sure you want to delete the \(topics[pointer!].name) topic?"),
                    message: Text("If you delete it, you will lose the main topic, its subtopics, and all the cards within the subtopics!!!"),
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
        .navigationTitle("Topics")
        .onAppear {
            loadTopics()
        }
        .toolbar {
            Button {
                stateSheet = .showingCreating
            }label: {
                Image(systemName: "plus")
            }
        }
    }

    var emptyView: some View {
        Text("Click the (+) to create a new Topic")
            .navigationTitle("Topics")
            .onAppear {
                loadTopics()
            }
            .toolbar {
                Button {
                    stateSheet = .showingCreating
                }label: {
                    Image(systemName: "plus")
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
        stateSheet = .showingEdit
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

