//
//  APICaller.swift
//  NetflixClone
//
//  Created by Hande Nur Yavaş on 15.06.2023.
//

import Foundation

struct Constants {
    static let baseURL = "https://api.themoviedb.org"
    
}

class APICaller {
    static let shared = APICaller()
    
    
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYzM1NjQyY2FiNzU2MmE1Y2ExNjAxYTc3YmJiNDI5NiIsInN1YiI6IjY0OGFmYjc3YzNjODkxMDBhZTRmNjk5ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5Pb_GdMBqw0SfxFIvtG87rMPV66H5WtO9rH108e6IHo"
        ]

        
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)/3/trending/all/day?language=en-US")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
              guard let responseData = data else {return }
              
              do {
                  let result = try JSONDecoder().decode(TrendingMoviesResponse.self, from: responseData)
                  
                  
              } catch {
                  print(error)
              }
              
            
          }
        })

        dataTask.resume()
    }
}

