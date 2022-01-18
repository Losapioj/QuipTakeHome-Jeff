//
//  HomeViewModel.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import Combine
import Foundation
import SwiftUI

class HomeViewModel: BaseViewModel {
    @Published var selectedDate: Date = Date()
    @Published var isButtonActive: Bool = false
    @Published var nextView: AnyView? = nil
    @Published var isReadyForNavigation: Bool = false
    
    override init() {
        super.init()
        
        $selectedDate
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .sink { [weak self] date in
                if date < Date() {
                    self?.isButtonActive = true
                } else {
                    self?.isButtonActive = false
                }
            }
            .store(in: &cancellableSet)
    }
    
    func goToSelectedDateImagesView() {
        let vm = DayImagesViewModel(selectedDate: Date())
        nextView = DayImagesView(viewModel: vm).erasedToAnyView()
        isReadyForNavigation = true
    }
}
