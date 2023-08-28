//
//  CardView.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 03/06/23.
//

import SwiftUI
import Data

struct CardView: View {
    @ObservedObject var dataController = DataController.shared
    var card: Card
    @Binding var delete: Bool
    var topic: String = "Cards"
    @State var title: String = "Title"
    @State var content: String = "Content"
    @State var rotationAngleCardTitle: CGFloat = 0
    @State var rotationAngleCardContent: CGFloat = -180
    @State var opacityCardTitle: CGFloat = 1
    @State var opacityCardContent: CGFloat = 0
    @State var showingSheet: Bool = false
    @State var color: Color

    var body: some View {
        ZStack {
            cardTitle
            cardContent
        }
        .modifier(FrameCardModify())
        .onAppear {
            title = card.title
            content = card.content
        }
        .navigationTitle(topic)
        .navigationBarTitleDisplayMode(.inline)
    }

    var cardTitle: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .padding(20)
                .foregroundColor(color)
                .overlay {
                    Text(title)
                }
            VStack {
                HStack() {
                    Spacer()
                    Button {
                        showingSheet = true
                    } label: {
                        Image(systemName: "pencil")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .modifier(ButtonModify())
                    Button {
                        delete.toggle()
                        dataController.deleteCard(card: card)
                    } label: {
                        Image(systemName: "trash")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .modifier(ButtonModify())
                }
                Spacer()
                HStack() {
                    Spacer()
                    Button {
                        rotarionFront()
                    } label: {
                        Image(systemName: "rotate.left")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .modifier(ButtonModify())
                }
            }
            .padding(40)
        }

        .sheet(isPresented: $showingSheet) {
            FormEditCard(card: card, title: $title, content: $content, showingSheet: $showingSheet)
        }
        .rotation3DEffect(.degrees(rotationAngleCardTitle), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            rotarionFront()
        }
        .opacity(opacityCardTitle)
    }

    var cardContent: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .padding(20)
                .foregroundColor(color)
                .overlay {
                    Text(content)
                        .lineLimit(100)
                        .padding(40)
                }
            VStack {
                Spacer()
                HStack() {
                    Spacer()
                    Button {
                        rotarionBack()
                    } label: {
                        Image(systemName: "rotate.left")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .modifier(ButtonModify())
                }
            }
            .padding(40)
        }

        .rotation3DEffect(.degrees(rotationAngleCardContent), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            rotarionBack()
        }
        .opacity(opacityCardContent)
    }


    func rotarionFront() {
        withAnimation(.easeInOut(duration: 0.3)) {
            rotationAngleCardTitle += 180
            rotationAngleCardContent += 180
            opacityCardTitle = 0
            opacityCardContent = 1
        }
    }

    func rotarionBack() {
        withAnimation(.easeInOut(duration: 0.3)) {
            rotationAngleCardTitle += 180
            rotationAngleCardContent += 180
            opacityCardTitle = 1
            opacityCardContent = 0
        }
    }
}
