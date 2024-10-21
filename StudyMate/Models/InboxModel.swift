//
//  InboxModel.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/21/24.
//

import Foundation

struct Messages: Codable, Identifiable {
    var id = UUID()
    var message, dateTime: String
    
    enum CodingKeys: String, CodingKey {
        case message, dateTime
    }
}

struct Chat: Codable, Identifiable {
    var id = UUID()
    var title, description: String
    var messages: [Messages]
    var username, firstName, lastName: String
    var profilePic: URL
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    enum CodingKeys: String, CodingKey {
        case title, description, messages, username, firstName, lastName, profilePic
    }
}

class ChatModel: ObservableObject {
    @Published var chats: [Chat] = []
    
    init() {
        loadData()
    }
    
    
    func loadData() {
        guard let url = URL(string: "https://api.npoint.io/033f2c0940cbb3c52aef") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to load chats: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data returned from the server")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let chatData = try jsonDecoder.decode([Chat].self, from: data)
                DispatchQueue.main.async {
                    self.chats = chatData
                }
            } catch {
                print("Failed to decode chats: \(error)")
            }
        }
        
        task.resume()
    }
}
