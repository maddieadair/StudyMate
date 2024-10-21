//
//  ChatRequestModel.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/20/24.
//

import Foundation

struct Request: Codable, Identifiable {
    var id = UUID()
    var title, description: String
    var dateTime: String
    var message, username: String
    var firstName, lastName: String
    var profilePic: URL
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    enum CodingKeys: String, CodingKey {
        case title, description, dateTime, message, username, firstName, lastName, profilePic
    }
}

class ChatRequestModel: ObservableObject {
    @Published var requests: [Request] = []
    
    init() {
        loadData()
    }
    
    
    func loadData() {
        guard let url = URL(string: "https://api.npoint.io/f504fca90b9bbd3db1b5") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to load chat requests: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data returned from the server")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let requestData = try jsonDecoder.decode([Request].self, from: data)
                DispatchQueue.main.async {
                    self.requests = requestData
                }
            } catch {
                print("Failed to decode chat requests: \(error)")
            }
        }
        
        task.resume()
    }
}
