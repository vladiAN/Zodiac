//
//  NumerologyViewModel.swift
//  Zodiac
//
//  Created by Алина Андрушок on 06.06.2023.
//

import Foundation

class NumerologyViewModel: ObservableObject {
    @Published var numerology: [Numerology] = []
    @Published var birthDate = Date()
    @Published var destinyNumber = 0
    

    func fetchNumerology() {
        let path = "/numerology?n=\(destinyNumber)"
        NetworkManager.shared.fetchData(forPath: path) { (data, _, _) in
            if let data = data {
                if let numerology = try? JSONDecoder().decode([Numerology].self, from: data) {
                    DispatchQueue.main.async {
                        self.numerology = numerology
                        print(self.destinyNumber)
                        print(numerology)
                    }
                } else {
                    print("!!!!!!")
                }
            }
        }
    }
    
    func calculateDestinyNumber() {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: birthDate)
        
        if let day = components.day, let month = components.month, let year = components.year {
            let dateString = String(day) + String(month) + String(year)
            let digits = dateString.compactMap { Int(String($0))}
            destinyNumber = digits.reduce(0, +) % 9
        }
    }
}

