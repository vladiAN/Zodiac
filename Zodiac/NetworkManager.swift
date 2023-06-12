//
//  NetworkManager.swift
//  Zodiac
//
//  Created by Андрушок on 30.05.2023.
//

import Foundation

struct Compatibility: Codable {
    let header, text: String
}

struct Numerology: Codable {
    let desc, number: String
}

struct SectionData: Hashable {
    let title: String
    let value: String
}

struct DescriptionSign: Codable {
    let about, career, compatibility, dateRange: String
        let element, health, love, man: String
        let name, nature, relationship, rulingPlanet: String
        let strengths, symbol, weaknesses, woman: String
    
    var sections: [SectionData] {
            let mirror = Mirror(reflecting: self)
            return mirror.children.compactMap { child in
                if let label = child.label {
                    return SectionData(title: label.capitalized, value: child.value as? String ?? "")
                }
                return nil
            }
        }

        enum CodingKeys: String, CodingKey {
            case about, career, compatibility
            case dateRange = "date_range"
            case element, health, love, man, name, nature, relationship
            case rulingPlanet = "ruling_planet"
            case strengths, symbol, weaknesses, woman
        }
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


