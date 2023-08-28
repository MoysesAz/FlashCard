//
//  ListCards.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 04/06/23.
//

import SwiftUI
import Data

struct CardsView: View {
    @State var showingSheet: Bool = false
    @State var showingStore: Bool = false
    var subTopic: SubTopic
    
    var body: some View {
        NavigationStack {
            ListCards(subTopic: subTopic)
            .navigationTitle("Cards")
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
            FormCreateCard(showingSheet: $showingSheet, showingStore: $showingStore, subTopic: subTopic)
        }
//        .sheet(isPresented: $showingStore) {
//            StoreView(topicSheet: )
//        }

    }
}
