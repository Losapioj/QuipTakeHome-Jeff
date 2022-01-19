//
//  Photo.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import Foundation

struct Photo: Codable, Identifiable, Equatable {
    var id: Int
    var imageURL: String
    var earthDate: String
    var camera: Camera
    var rover: Rover
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageURL = "img_src"
        case earthDate = "earth_date"
        case camera
        case rover
    }
    
    static let mock = Photo(id: 1, imageURL: "https://via.placeholder.com/100", earthDate: "2000-1-1", camera: Camera.mock, rover: Rover.mock)
}
