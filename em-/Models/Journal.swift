//
//  Journal.swift
//  em-
//
//  Created by Chau Nguyen on 3/25/23.
//

import UIKit
import Foundation
import CoreLocation

struct Journal: Hashable, Codable, Identifiable {
    var id: String { journal_id }
    let journal_id: String
    let user_id: String
    let title: String
    let journal: String
    var sentiment: String=""
    var posted_time: String=""
    let latitude: String
    let longitude: String
}
