//
//  ProfileViewModel.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 09.06.2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var descriptionSign: DescriptionSign?
    @Published var descriptionNumber: Numerology?
    @Published var isDescriptionDataLoading = false
    @Published var isNumerologyDataLoading = false
    @Published var showDescriptionSignScreen = false
    @Published var showDescriptionNumberScreen = false
    @Published var destinyNumberProfile = 1
    @Published var zodiacSignProfileImageName: String = "leo"
    @Published var destynyNumberProfileImageName: String = "one"
    
    func fetchDescriptionSign() {
        let path = "/sign?s=\(zodiacSignProfileImageName)"
        NetworkManager.shared.fetchData(forPath: path) { (data, _, _) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let descriptionSign = try decoder.decode(DescriptionSign.self, from: data)
                    DispatchQueue.main.async {
                        self.descriptionSign = descriptionSign
                        self.isDescriptionDataLoading = false
                        self.showDescriptionSignScreen = true
                    }
                } catch {
                    print("Error decoding description data: \(error)")
                }
            }
        }
    }
    
    func fetchNumerology() {
        let path = "/numerology?n=\(destinyNumberProfile)"
        NetworkManager.shared.fetchData(forPath: path) { (data, _, _) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let numerologyDict = json as? [String: Any] {
                        let descriptionNumber = Numerology(desc: numerologyDict["desc"] as? String ?? "",
                                                    number: numerologyDict["number"] as? String ?? "")
                        DispatchQueue.main.async {
                            self.descriptionNumber = descriptionNumber
                            self.isNumerologyDataLoading = false
                            self.showDescriptionNumberScreen = true
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
    

    
}
