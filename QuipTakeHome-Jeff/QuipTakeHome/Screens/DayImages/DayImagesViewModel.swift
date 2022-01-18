//
//  DayImagesViewModel.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import Foundation
import SwiftUI

class DayImagesViewModel: BaseViewModel {
    var selectedDate: Date
    var photos: [Photo] = []
    
    init(selectedDate: Date) {
        self.selectedDate = selectedDate
        
        super.init()
        
        MarsRoverImagesNetwork.request(.dateImagesPath, date: selectedDate)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.alert = Alert(
                        title: Text("Error"),
                        message: Text(error.localizedDescription),
                        dismissButton: Alert.Button.default(Text("okay"))
                    )
                    
                default:
                    return
                }
            }, receiveValue: { [weak self] photos in
                self?.photos = photos
            })
            .store(in: &cancellableSet)
    }
}
