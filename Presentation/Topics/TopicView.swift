//
//  ContentView.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 01/06/23.
//

import SwiftUI
import Data


struct TopicView: View {
    @State var showingSheet: Bool = false

    var body: some View {
        NavigationStack {
            ListTopics()
                .navigationTitle("Topics")
                .toolbar {
                    Button {
                        showingSheet.toggle()
                    }label: {
                        Image(systemName: "plus")
                    }
                }
        }
        .sheet(isPresented: $showingSheet) {
            FormTopic(showingSheet: $showingSheet)
        }
    }
}
