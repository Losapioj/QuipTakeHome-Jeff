//
//  Constants.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import CoreGraphics
import Foundation

struct Constants {
    static let buttonCornerRadius: CGFloat = 16.0
    static let gridSpacing: CGFloat = 8
    
    struct Network {
        static let apiKey: String = "QppYU9y3lifyINNdMOP9hIA83VetiKjjk91IFgDl"
        static let baseURL: URL? = URL(string: "https://api.nasa.gov/")
    }
}
