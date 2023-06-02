//
//  CompatibilityViewModel.swift
//  Zodiac
//
//  Created by Андрушок on 30.05.2023.
//

import Foundation

enum SelectedSign {
    case firstSign
    case secondSign
}

class CompatibilityViewModel: ObservableObject {
//    @Published var compatibilities: [Compatibility] = []
    @Published var showDatePickerView = false
    @Published var isFirstButtonDisabled = false
    @Published var isSecondButtonDisabled = false
    @Published var firstSignImage = "plus"
    @Published var secondSignImage = "plus"
    @Published var firstSignName = "Add"
    @Published var secondSignName = "Add"
    @Published var selectedSign: SelectedSign = .firstSign
    
    
    
    func continueButtonTapped(zodiacSignImageName: String, for sign: SelectedSign) {
            showDatePickerView = false
            
            if sign == .firstSign {
                firstSignImage = zodiacSignImageName
                firstSignName =  zodiacSignImageName.capitalized
            } else if sign == .secondSign {
                secondSignImage = zodiacSignImageName
                secondSignName = zodiacSignImageName.capitalized
            }
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

