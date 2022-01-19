//
//  Photo.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import Foundation

struct Photo: Codable, Identifiable {
    var id: Int
    var imageURL: String
    var camera: Camera
    var rover: Rover
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageURL = "img_src"
        case camera
        case rover
    }
    
    static let mock = Photo(id: 1, imageURL: "https://via.placeholder.com/100", camera: Camera.mock, rover: Rover.mock)
}
