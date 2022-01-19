//
//  DayPhotosView.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import SwiftUI

struct DayPhotosView: View {
    @StateObject var viewModel: DayPhotosViewModel
    
    var body: some View {
        ScrollView {
            NavigationLink(destination: viewModel.nextView, isActive: $viewModel.isReadyForNavigation) { EmptyView() }
            
            LazyVGrid(columns: viewModel.gridItems, spacing: Constants.defaultSpacing) {
                PhotoListView(photoList: $viewModel.photoArray) { photoClicked in
                    viewModel.photoClicked(photo: photoClicked)
                }
            }
        }
        .alert(isPresented: $viewModel.alert.isNullBinding()) {
            viewModel.alert ?? Alert(title: Text(""))
        }
    }
}

struct DayImagesView_Previews: PreviewProvider {
    static var previews: some View {
        DayPhotosView(viewModel: DayPhotosViewModel(selectedDate: Date()))
    }
}
