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
    @State var color: Color = Color.blue

    var body: some View {
        ScrollView {
            ForEach(cards, id: \.self) { card in
                CardView(card: card, color: color)

            }
            .onAppear {
                let valueColor = subTopic.color.decodeCGFloatList()
                guard let listValues = valueColor else { return }
                color = Color(red: listValues[0], green: listValues[1], blue: listValues[2], opacity: listValues[3])
                let array = subTopic.cards?.allObjects as! [Card]
                cards = array
            }
        }
    }
    
}
