//
//  FrameCardModify.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 05/06/23.
//

import SwiftUI

struct FrameCardModify: ViewModifier {
    func body(content: Content) -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return content
                .frame(height: 500)
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            return content
                .frame(height: 800)
        } else {
            return content
                .frame(height: 1000)
        }
    }
}
