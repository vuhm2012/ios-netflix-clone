//
//  APICaller.swift
//  NetflixClone
//
//  Created by it on 15/06/22.
//

import Foundation

struct Constants {
    static let API_KEY = "ff19c02b4cdae6a720f195f2b3ff17ae"
    static let BASE_URL = "https://api.themoviedb.org/3"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.BASE_URL)/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
        
    }
    
}
