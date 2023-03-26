//
//  Event.swift
//  em-
//
//  Created by Oanh Le on 3/25/23.
//

import SwiftUI
import Foundation
import CoreLocation

struct Event: Hashable, Codable, Identifiable {
    let id: Int
    let name: String!
    let from_time: String!
    let to_time: String!
    let location: String!
    let tags: String!
    
    init(id: Int, name: String, from_time: String, to_time: String, location: String, tags: String) {
        self.id = id
        self.name = name
        self.from_time = from_time
        self.to_time = to_time
        self.location = location
        self.tags = tags
    }
//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }

//    private var coordinates: Coordinates
//    var locationCoordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: coordinates.latitude,
//            longitude: coordinates.longitude)
//    }
//
//    struct Coordinates: Hashable, Codable {
//        var latitude: Double
//        var longitude: Double
//    }
}
