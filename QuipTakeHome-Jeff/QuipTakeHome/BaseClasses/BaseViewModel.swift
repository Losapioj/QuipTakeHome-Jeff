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
    @Published var nextView: AnyView? = nil
    @Published var isReadyForNavigation: Bool = false
    
    init() {
        $nextView
            .receive(on: DispatchQueue.main)
            .sink { [weak self] view in
                if view != nil {
                    self?.isReadyForNavigation = true
                } else {
                    self?.isReadyForNavigation = false
                }
            }
            .store(in: &cancellableSet)
    }
}
