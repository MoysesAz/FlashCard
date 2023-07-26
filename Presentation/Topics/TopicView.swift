//
//  ContentView.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 01/06/23.
//

import SwiftUI
import UIKit
import GoogleMobileAds


struct TopicView: View {
    @State var showingSheet: Bool = false
    @State var showingStore: Bool = false

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
        .id(showingSheet)
        .sheet(isPresented: $showingSheet) {
            FormTopic(showingSheet: $showingSheet, showingStore: $showingStore)
        }
        .sheet(isPresented: $showingStore) {
            StoreView()
        }
    }


}

