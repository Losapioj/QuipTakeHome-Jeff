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
    @Published var selectedDate: Date
    @Published var isButtonActive: Bool = false
    
    override init() {
        selectedDate = Date()
        
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
        let vm = DayPhotosViewModel(selectedDate: selectedDate)
        nextView = DayPhotosView(viewModel: vm).erasedToAnyView()
    }
}
