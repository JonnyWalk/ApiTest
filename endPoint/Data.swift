//
//  Data.swift
//  endPoint
//
//  Created by Jonny Walker on 27/09/2020.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    var type: String
    var setup: String
    var punchline: String
}

class Api{
    func getPosts(completion: @escaping([Post]) -> ()) {
        
        guard let url = URL(string: "https://official-joke-api.appspot.com/random_ten") else { return }
        URLSession.shared.dataTask(with: url) { (data, _ , _) in
            
            guard let data = data else{ return }

            let posts = try! JSONDecoder().decode([Post].self, from: data)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
    
}
