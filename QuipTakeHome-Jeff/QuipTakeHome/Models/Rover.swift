//
//  Rover.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/18/22.
//

import Foundation

struct Rover: Codable, Identifiable {
    var id: Int
    var name: String
    var landingDate: String
    var launchDate: String
    var status: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
    
    static let mock = Rover(id: 1, name: "Rover", landingDate: "2000-1-1", launchDate: "1999-1-1", status: "Active")
}
