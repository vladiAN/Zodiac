//
//  CompatibilityViewModel.swift
//  Zodiac
//
//  Created by Андрушок on 30.05.2023.
//

import Foundation

class CompatibilityViewModel: ObservableObject {
//    @Published var compatibilities: [Compatibility] = []
    @Published var showDatePickerView = false
    @Published var firstSignImage = "plus"
    @Published var secondSignImage = "plus"
    @Published var firstSignName = "Add"
    @Published var secondSignName = "Add"
    
    
    
    func continueButtonTapped() {
        showDatePickerView = false

    }
    
//    func fetchCompatibility() {
//        let path = "/affinity?sign1=\(selectedSign1.lowercased())&sign2=\(selectedSign2.lowercased())"
//
//        NetworkManager.shared.fetchData(forPath: path) { (data, _, _) in
//            if let data = data {
//                if let compatibilities = try? JSONDecoder().decode([Compatibility].self, from: data) {
//                    DispatchQueue.main.async {
//                        self.compatibilities = compatibilities
//                    }
//                }
//            }
//        }
//    }
    
}

