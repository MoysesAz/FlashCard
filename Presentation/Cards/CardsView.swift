//
//  ListCards.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 04/06/23.
//

import SwiftUI
import Data

struct CardsView: View {
    @State var stateSheet: StateSheet?
    var subTopic: SubTopic
    @State var delete: Bool = false
    @State var cards: [Card] = []
    @State var color: Color = Color.blue
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(cards, id: \.self) { card in
                    CardView(card: card, delete: $delete, color: color)
                }
                .onAppear {
                    let valueColor = subTopic.color.decodeCGFloatList()
                    guard let listValues = valueColor else { return }
                    color = Color(red: listValues[0], green: listValues[1], blue: listValues[2], opacity: listValues[3])
                    let array = subTopic.cards?.allObjects as! [Card]
                    cards = array
                }
            }
            .id(stateSheet)
            .id(delete)
            .navigationTitle("\(subTopic.name) Cards")
            .toolbar {
                Button {
                    stateSheet = .showingCreating
                }label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(item: $stateSheet) { item in
            switch item {
            case .showingCreating:
                FormCreateCard(stateSheet: $stateSheet, subTopic: subTopic)
                    .presentationDetents([.medium])
            case .showingEdit:
                EmptyView()
            case .showingStore:
                StoreView(stateSheet: $stateSheet)
                    .presentationDetents([.medium])
            }
        }
    }
}
