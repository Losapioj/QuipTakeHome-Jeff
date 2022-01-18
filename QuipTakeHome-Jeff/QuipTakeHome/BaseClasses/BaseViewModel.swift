//
//  BaseViewModel.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import SwiftUI
import Combine

class BaseViewModel: ObservableObject {
    var cancellableSet: Set<AnyCancellable> = []
    @Published var alert: Alert?
}
