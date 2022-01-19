//
//  HomeView.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: viewModel.nextView, isActive: $viewModel.isReadyForNavigation) { EmptyView() }
                
                Text("Mars Rover Images")
                    .font(.title)
                
                Spacer()
                
                DatePicker(
                    "Select date for images",
                    selection: $viewModel.selectedDate,
                    displayedComponents: .date
                )
                
                Spacer()
                
                TextButton(
                    title: "Search For Curiosity Images",
                    isEnabled: $viewModel.isButtonActive
                ) {
                    viewModel.goToSelectedDateImagesView()
                }
            }
            .padding()
            .navigationTitle("Date Selection")
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
