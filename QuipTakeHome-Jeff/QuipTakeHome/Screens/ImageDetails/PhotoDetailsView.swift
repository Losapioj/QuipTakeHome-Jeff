//
//  PhotoDetailsView.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import SwiftUI

struct PhotoDetailsView: View {
    @StateObject var viewModel: PhotoDetailsViewModel
    
    var body: some View {
        VStack(spacing: Constants.defaultSpacing) {
            AsyncImage(url: viewModel.photoURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            
            Spacer()
            
            RoverDetails(viewModel: viewModel)
            
            CameraDetails(viewModel: viewModel)
        }
        .padding(.all)
        .navigationTitle("Image Details")
    }
}

private struct RoverDetails: View {
    @ObservedObject var viewModel: PhotoDetailsViewModel
    
    var body: some View {
        VStack(spacing: Constants.defaultSpacing) {
            Text("Rover")
                .font(.title3)
            
            LabelWithInfo(label: "Full Name:", info: viewModel.roverName)
            LabelWithInfo(label: "Launch Date:", info: viewModel.roverLaunchDate)
            LabelWithInfo(label: "Landing Date:", info: viewModel.roverLandingDate)
            LabelWithInfo(label: "Status:", info: viewModel.roverStatus)
        }
    }
}

private struct CameraDetails: View {
    @ObservedObject var viewModel: PhotoDetailsViewModel
    
    var body: some View {
        VStack(spacing: Constants.defaultSpacing) {
            Text("Camera")
                .font(.title2)
            
            LabelWithInfo(label: "Full Name:", info: viewModel.cameraFullName)
            LabelWithInfo(label: "Name Abbreviation:", info: viewModel.cameraAbbreviation)
        }
    }
}

struct ImageDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        PhotoDetailsView(viewModel: PhotoDetailsViewModel(Photo.mock))
    }
}
