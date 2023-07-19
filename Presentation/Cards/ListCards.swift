//
//  ListCards.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 04/06/23.
//

import SwiftUI
import Data

struct ListCards: View {
    @Environment(\.managedObjectContext) var moc
    @State var cards: [Card] = []
    @State var showingSheet: Bool = false
    var topic: Topic
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(cards, id: \.self) { card in
                        CardView(card: card)
                }
            }
            .navigationTitle("Cards")
            .toolbar {
                Button {
                    showingSheet.toggle()
                }label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingSheet) {
//            FormCreateCard(showingSheet: $showingSheet, topic: topic)
        }
    }
}
