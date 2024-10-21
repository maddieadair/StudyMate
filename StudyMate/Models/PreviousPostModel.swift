//
//  PreviousPostModel.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/20/24.
//

import Foundation

struct PrevPost: Codable, Identifiable {
    var id = UUID()
    var title, description, time, subject: String
    var image: [URL]
    
    enum CodingKeys: String, CodingKey {
        case title, description, time, subject, image
    }
}

class PrevPostViewModel: ObservableObject {
    @Published var prevPosts: [PrevPost] = []

    init() {
        loadData()
    }
    
    
    func loadData() {
        guard let url = URL(string: "https://api.npoint.io/2b8c3b4d8c7fa909347f") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to load previous posts: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data returned from the server")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let postData = try jsonDecoder.decode([PrevPost].self, from: data)
                DispatchQueue.main.async {
                    self.prevPosts = postData
                }
            } catch {
                print("Failed to decode previous posts: \(error)")
            }
        }
        
        task.resume()
    }
}
