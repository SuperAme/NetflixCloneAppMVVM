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

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results.results[0])
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
