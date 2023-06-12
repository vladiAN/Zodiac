//
//  ProfileViewModel.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 09.06.2023.
//

import Foundation

class ProfileViewModel {
    @Published var descriptionSign: DescriptionSign?
    @Published var zodiacSignImageName: String = "leo"
    @Published var fateNumberImageName: String = "one"
    
//    func fetchDescriptionSign() {
//        let path = "/sign?s=\(zodiacSignImageName)"
//        NetworkManager.shared.fetchData(forPath: path) { (data, _, _) in
//            if let data = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    if let descriptionSignDict = json as? [String: Any] {
//                        let descriptionSign = DescriptionSign(about: descriptionSignDict["about"] as? String ?? "",
//                                                              career: descriptionSignDict["number"] as? String ?? "")
//                        DispatchQueue.main.async {
//                            self.descriptionSign = descriptionSign
//                            self.isNumerologyDataLoading = false
//                        }
//                    } else {
//                        print("Invalid numerology data format")
//                    }
//                } catch {
//                    print("Error decoding numerology data: \(error)")
//                }
//            }
//        }
//    }
    
}
