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
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageURL = "img_src"
    }
}
