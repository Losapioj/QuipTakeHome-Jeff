//
//  Camera.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/18/22.
//

import Foundation

struct Camera: Codable, Identifiable {
    var id: Int
    var name: String
    var abbreviation: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "full_name"
        case abbreviation = "name"
    }
    
    static let mock = Camera(id: 1, name: "Camera", abbreviation: "CAM")
}
