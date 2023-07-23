//
//  SubTopicView.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 20/07/23.
//

import SwiftUI
import Data

struct SubTopicView: View {
    @State var showingSheet: Bool = false
    let topic: Topic

    var body: some View {
        NavigationStack {
            ListSubTopics(topic: topic)
                .navigationTitle("SubTopics")
                .toolbar {
                    Button {
                        showingSheet.toggle()
                    }label: {
                        Image(systemName: "plus")
                    }
                }
        }
        .id(showingSheet)
        .sheet(isPresented: $showingSheet) {
            FormSubTopic(showingSheet: $showingSheet, topic: topic)
        }
    }
}
