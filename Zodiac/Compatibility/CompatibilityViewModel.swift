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
    @Published var compatibilities: [Compatibility] = []
    @Published var showCompatibilityScreen = false
    @Published var showDatePickerView = false
    @Published var isFirstButtonDisabled = false
    @Published var isSecondButtonDisabled = false
    @Published var isCompatibilityDataLoading = false
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
    
    func fetchCompatibility() {
        let path = "/affinity?sign1=\(firstSignImage)&sign2=\(secondSignImage)"
        NetworkManager.shared.fetchData(forPath: path) { (data, _, _) in
            if let data = data {
                if let compatibilities = try? JSONDecoder().decode([Compatibility].self, from: data) {
                    DispatchQueue.main.async {
                        self.compatibilities = compatibilities
                        self.isCompatibilityDataLoading = false
                        self.showCompatibilityScreen = true
                        
                        print(compatibilities)
                    }
                }
            }
        }
    }
    
    func test() {
        print(firstSignImage, secondSignImage)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                print(self.compatibilities)
                            }
        
    }
    
}

