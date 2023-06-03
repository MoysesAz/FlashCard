//
//  ButtonModify.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 03/06/23.
//

import SwiftUI

struct ButtonModify: ViewModifier {
    func body(content: Content) -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return content
                .foregroundColor(.white)
                .frame(width: 20, height: 20)
                .padding(10)
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            return content
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .padding(20)
        } else {
            return content
                .foregroundColor(.white)
                .frame(width: 100, height: 100)
                .padding(30)
        }
    }
}


struct PaddingModify: ViewModifier {
    func body(content: Content) -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return content
                .padding(10)
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            return content
                .padding(10)
        } else if UIDevice.current.userInterfaceIdiom == .mac {
            return content
                .padding(10)
        } else {
            return content
                .padding(10)
        }
    }
}
