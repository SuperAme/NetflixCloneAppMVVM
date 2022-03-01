//
//  APICaller.swift
//  NetflixCloneAppMVVM
//
//  Created by Américo MQ on 01/03/22.
//

import Foundation

struct Constants {
    static let apiKey = "a9e48791899314569ffacc427ec23393"
    static let baseURL = "https://api.themoviedb.org/"
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
