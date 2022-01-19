//
//  PhotoDetailsViewModel.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import Foundation

class PhotoDetailsViewModel: BaseViewModel {
    let photoURL: URL?
    
    let roverName: String
    let roverLandingDate: String
    let roverLaunchDate: String
    let roverStatus: String
    
    let cameraFullName: String
    let cameraAbbreviation: String
    
    init(_ photo: Photo) {
        photoURL = URL(string: photo.imageURL)
        
        let rover = photo.rover
        roverName = rover.name
        roverLandingDate = rover.landingDate
        roverLaunchDate = rover.launchDate
        roverStatus = rover.status
        
        let camera = photo.camera
        cameraFullName = camera.name
        cameraAbbreviation = camera.abbreviation
    }
    
}
