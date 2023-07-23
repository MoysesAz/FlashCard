//
//  ListCards.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 20/07/23.
//

import SwiftUI
import Data

struct ListCards: View {
    let subTopic: SubTopic
    @State var cards: [Card] = []

    var body: some View {
        ScrollView {
            ForEach(cards, id: \.self) { card in
                CardView(card: card)
            }
            .onAppear {
                let array = subTopic.cards?.allObjects as! [Card]
                cards = array
            }
        }
    }
    
}
