//
//  Colors.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import SwiftUI

extension Color {
    static let buttonBackgroundDisabled = Color(hex: 0xF0F0F0)
    static let buttonBackgroundEnabled = Color(hex: 0xDDDDDD)
    static let buttonTextDisabled = Color.gray
    static let buttonTextEnabled = Color.black
}

private extension Color {
    init(hex: Int, opacity: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: opacity)
    }
}
