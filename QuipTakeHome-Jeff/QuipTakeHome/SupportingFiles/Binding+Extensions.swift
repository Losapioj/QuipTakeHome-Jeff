//
//  Binding+Extensions.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import SwiftUI

extension Binding where Value == Alert? {
    public func isNullBinding() -> Binding<Bool> {
        return Binding<Bool>(
            get: { self.wrappedValue != nil },
            set: { self.wrappedValue = $0 ? Alert(title: Text("")) : nil }
        )
    }
}
