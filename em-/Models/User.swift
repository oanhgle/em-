//
//  User.swift
//  em-
//
//  Created by Yen Le on 3/26/23.
//

import Foundation

class UserManager:ObservableObject{
    
    @Published var name: String = ""
    @Published var id: String = ""
    @Published var email: String = ""
    @Published var publicKey: String = ""
    @Published var privateKey: String = ""
    
    func createUser (email: String, name:String, password:String,completion: @escaping (String)->Void)-> Bool {
        
        var successSignIn = true
        // Generate public Key
        // Generate private key
        let publicKey = "TestPublicKey"
        let privateKey = "TestPrivateKey"
        let error500 : String = "<!doctype html>\n<html lang=en>\n<title>500 Internal Server Error</title>\n<h1>Internal Server Error</h1>\n<p>The server encountered an internal error and was unable to complete your request. Either the server is overloaded or there is an error in the application.</p>\n"
        
        var semaphore = DispatchSemaphore (value: 0)
        let parameters = "{\n    \"email\": \"" + email + "\",\n    \"name\": \"" + name + "\",\n    \"password\": \"" + password + "\", \n    \"publicKey\": \"" + publicKey + "\", \n    \"privateKey\": \"" + privateKey + "\"}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://127.0.0.1:3000/api/signup")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            var d = String(data: data, encoding: .utf8)
            semaphore.signal()
            if (d == error500){
                successSignIn = false
                print("In loop",successSignIn)
            }
            else{
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                      print(json)
                        guard let user = json["user"] as? [String:Any],
                              let name = user["name"]
                        else {
                            return
                        }
                        semaphore.signal()
//                        ret = id as! String
                        self.name = name as! String
//                        print("RET", ret)
                        completion(self.name)
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
        semaphore.wait()
        return successSignIn
    }
     
    func loginUser(email:String, password:String, completion: @escaping (String)->Void) -> Bool{
        // hardcode error :)
        let error401 : String = "<!doctype html>\n<html lang=en>\n<title>401 Unauthorized</title>\n<h1>Unauthorized</h1>\n<p>The server could not verify that you are authorized to access the URL requested. You either supplied the wrong credentials (e.g. a bad password), or your browser doesn&#39;t understand how to supply the credentials required.</p>\n"

        var successLogin = true
        var semaphore = DispatchSemaphore (value: 0)
        let parameters = "{\n    \"email\": \"" + email + "\",\n    \"password\": \"" + password + "\"}"
        let postData = parameters.data(using: .utf8)
                
        var request = URLRequest(url: URL(string: "http://127.0.0.1:3000/api/login")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
        request.httpMethod = "POST"
        request.httpBody = postData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            var d = String(data: data, encoding: .utf8)
            semaphore.signal()
            if (d == error401){
                successLogin = false
            }
            else{
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                      print(json)
                        guard let user = json["user"] as? [String:Any],
                              let name = user["name"]
                        else {
                            return
                        }
                        semaphore.signal()
//                        ret = id as! String
                        self.name = name as! String
//                        print("RET", ret)
                        completion(self.name)
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
        semaphore.wait()
        return (successLogin)
    }
    
}

