//
//  NumerologyViewModel.swift
//  Zodiac
//
//  Created by Алина Андрушок on 06.06.2023.
//

import Foundation

class NumerologyViewModel: ObservableObject {
    @Published var numerology: Numerology?
    @Published var birthDate = Date()
    @Published var destinyNumber = 0
    @Published var isNumerologyDataLoading = false
    @Published var isNumberReceived = false
    @Published var destinyNumberImage = "one"
    @Published var isOpenDecryption = false
    
    func fetchNumerology() {
        let path = "/numerology?n=\(destinyNumber)"
        NetworkManager.shared.fetchData(forPath: path) { (data, _, _) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let numerologyDict = json as? [String: Any] {
                        let numerology = Numerology(desc: numerologyDict["desc"] as? String ?? "",
                                                    number: numerologyDict["number"] as? String ?? "")
                        DispatchQueue.main.async {
                            self.numerology = numerology
                            self.isNumerologyDataLoading = false
                        }
                    } else {
                        print("Invalid numerology data format")
                    }
                } catch {
                    print("Error decoding numerology data: \(error)")
                }
            }
        }
    }
    
    func calculateDestinyNumber() {
        destinyNumber = birthDate.calculateDestinyNumber().0
        destinyNumberImage = birthDate.calculateDestinyNumber().1
    }
    
}



extension Date {
    func calculateDestinyNumber() -> (Int, String) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: self)
        
        if let day = components.day, let month = components.month, let year = components.year {
            let dateString = String(day) + String(month) + String(year)
            let digits = dateString.compactMap { Int(String($0))}
            let sum = digits.reduce(0, +)
            let destinyNumber = sum % 9 != 0 ? sum % 9 : 9
            let destinyNumberImage = destinyNumber.getNumberImage()
            return (destinyNumber, destinyNumberImage)
        }
        
        return (0, "")
    }
}
