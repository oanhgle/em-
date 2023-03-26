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
}
