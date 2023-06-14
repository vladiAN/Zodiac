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

struct Horoscope: Codable {
    let success: Bool
    let payload: HoroscopePayload
}

struct HoroscopePayload: Codable {
    let aquarius, aries, cancer, capricorn: String
       let gemini, leo, libra, pisces: String
       let sagittarius, scorpio, taurus, virgo: String
       let updatedAt: String

       enum CodingKeys: String, CodingKey {
           case aquarius = "Aquarius"
           case aries = "Aries"
           case cancer = "Cancer"
           case capricorn = "Capricorn"
           case gemini = "Gemini"
           case leo = "Leo"
           case libra = "Libra"
           case pisces = "Pisces"
           case sagittarius = "Sagittarius"
           case scorpio = "Scorpio"
           case taurus = "Taurus"
           case virgo = "Virgo"
           case updatedAt
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
    
    func fetchHoroscope(completion: @escaping (Result<Horoscope, Error>) -> Void) {
        let headers = [
            "X-RapidAPI-Key": "3f13e8445emsh7ffe1b49d445fe1p11a5b4jsn68e5a53bf57a",
            "X-RapidAPI-Host": "horoscope34.p.rapidapi.com"
        ]
        
        guard let url = URL(string: "https://horoscope34.p.rapidapi.com/api/horoscope/today") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Horoscope.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        
        dataTask.resume()
    }

    
}


