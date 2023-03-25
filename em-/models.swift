//
//  models.swift
//  em-
//
//  Created by Chau Nguyen on 3/25/23.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

class Api : ObservableObject{
    @Published var events = [Event]()
//    func loadData() {
    func loadData(completion:@escaping ([Event]) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:5000/api/events/True") else {
            print("Invalid url...")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data, let string = String(data: data, encoding: .utf8){
//                print(string)
//            }
            let events = try! JSONDecoder().decode([Event].self, from: data!)
            DispatchQueue.main.async {
                completion(events)
            }
        }
        task.resume()
    }
}

struct Event: Codable, Hashable {
    let id: Int
    let name: String
    let from_time: String
    let to_time: String
    let location: String
    let tags: String
}

