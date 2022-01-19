//
//  DayPhotosViewModel.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import Foundation
import SwiftUI

class DayPhotosViewModel: BaseViewModel {
    var selectedDate: Date
    @Published var gridItems: [GridItem]
    @Published var photoArray: [Photo] = []
    
    init(selectedDate: Date) {
        self.selectedDate = selectedDate
        self.gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        
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
                self?.photoArray = photos
            })
            .store(in: &cancellableSet)
    }
    
    func photoClicked(photo: Photo) {
        let vm = PhotoDetailsViewModel(photo)
        self.nextView = PhotoDetailsView(viewModel: vm).erasedToAnyView()
    }
}
