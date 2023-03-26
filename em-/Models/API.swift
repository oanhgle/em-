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

class API : ObservableObject{
    @Published var events = [Event]()
    @Published var journals = [Journal]()
    
    // Get all events from DB
    func loadEvents(completion:@escaping ([Event]) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:5000/api/events") else {
            print("Invalid url...")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let events = try! JSONDecoder().decode([Event].self, from: data!)
            DispatchQueue.main.async {
                completion(events)
            }
        }
        task.resume()
    }
    
    // Create a new row in Journal
    func createJournal(journal: Journal) {
        let semaphore = DispatchSemaphore (value: 0)
            
        let parameters = "{\n    \"journal_id\": \"\(journal.journal_id)\",\n    \"user_id\": \"\(journal.user_id)\",\n    \"title\": \"\(journal.title)\",\n    \"journal\": \"\(journal.journal)\",\n    \"posted_time\": \"123\",\n    \"latitude\": \"\(journal.latitude)\",\n    \"longitude\": \"\(journal.longitude)\"\n}"
        let postData = parameters.data(using: .utf8)
            
        var request = URLRequest(url: URL(string: "http://127.0.0.1:5000/api/journals/analyze_sentiment")!, timeoutInterval: Double.infinity)
//        var request = URLRequest(url: URL(string: "http://127.0.0.1:5000/api/journals/create")!, timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
    func getJournal(journal_id: String, completion:@escaping ([Journal]) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:5000/api/journals/\(journal_id)") else {
            print("Invalid url...")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let journals = try! JSONDecoder().decode([Journal].self, from: data!)
            DispatchQueue.main.async {
                completion(journals)
            }
        }
        task.resume()
    }
    
    func getJournalForMap(completion:@escaping ([Journal]) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:5000/api/journals/all") else {
            print("Invalid url...")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let journals = try! JSONDecoder().decode([Journal].self, from: data!)
            DispatchQueue.main.async {
                completion(journals)
            }
        }
        task.resume()
    }
    
//    func getUserName(user_id: String, completion:@escaping (String) -> Void) {
//        let semaphore = DispatchSemaphore (value: 0)
//        guard let url = URL(string: "http://127.0.0.1:3000/api/get_id/\(user_id)") else {
//            print("Invalid url...")
//            return
//        }
//
////        let task = URLSession.shared.dataTask(with: url) { data, response, error in
////            let users = try! JSONDecoder().decode([User].self, from: data!)
////            print("")
////            print(users)
////            DispatchQueue.main.async {
////                completion(users)
////            }
////        }
////        task.resume()
//        let task = URLSession.shared.dataTask(with:url) { data, response, error in
//            guard let data = data else {
//                print(String(describing: error))
//                semaphore.signal()
//                return
//            }
//            print(String(data: data, encoding: .utf8)!)
//            semaphore.signal()
//        }
//        task.resume()
//        semaphore.wait()
//    }
}
