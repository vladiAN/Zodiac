//
//  NetworkManager.swift
//  Zodiac
//
//  Created by Андрушок on 30.05.2023.
//

import Foundation



import Foundation

import Foundation

struct Compatibility: Codable {
    let header, text: String
}

struct Numerology: Codable {
    let desc, number: String
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    let headers = [
        "X-RapidAPI-Key": "d24a32bcd0mshb80160bcd236dd0p1e973ejsnd7c968e943bf",
        "X-RapidAPI-Host": "horoscope-astrology.p.rapidapi.com"
    ]
    
    func fetchData(forPath path: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let urlString = "https://horoscope-astrology.p.rapidapi.com\(path)"
        
        if let url = URL(string: urlString) {
            
            var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request, completionHandler: completion)
            
            dataTask.resume()
            
        } else {
            
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            completion(nil, nil, error)
        }
    }
}


