//
//  UIAplication+.swift
//  Presentation
//
//  Created by Moyses Miranda do Vale Azevedo on 24/08/23.
//

import UIKit

extension UIApplication {
    func getLastWindow() -> UIWindow? {
        let window = UIApplication
            .shared
            .connectedScenes
        let lastWindow = window.flatMap{ ($0 as? UIWindowScene)?.windows ?? [] }.last
        return lastWindow
    }
}
