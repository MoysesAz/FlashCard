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


struct TopicView: View {

    @ObservedObject var dataController = DataController.shared
    @State private var topics: [Topic] = []
    @State private var showingSheet: Bool = false
    @State private var showingStore: Bool = false
    @State private var showingAlert = false
    @State private var showingEdit = false

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
                    showingSheet.toggle()
                }label: {
                    Image(systemName: "plus")
                }
            }
        }
        .id(showingSheet || showingEdit)
        .sheet(isPresented: $showingEdit) {
            FormEditTopic(showingSheet: $showingEdit, topic: getTopic())
        }
        .sheet(isPresented: $showingSheet) {
            FormTopic(showingSheet: $showingSheet, showingStore: $showingStore)
        }
        .sheet(isPresented: $showingStore) {
            StoreView()
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
        showingEdit = true
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

