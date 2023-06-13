//
//  FirstScreenViewModel.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 09.06.2023.
//

import Foundation

class FirstScreenViewModel: ObservableObject {
    @Published var selectedDate: Date
    
    init() {
        selectedDate = Date()
    }
    
    func saveSelectedDate() {
        UserDefaults.standard.set(selectedDate, forKey: "currentDate")
    }
    
    func saveImageNameForProfile() {
        let zodiacSign = Calendar.current.updateZodiacSign(for: selectedDate) ?? "leo"
        UserDefaults.standard.set(zodiacSign, forKey: "imageNameForProfile")
    }
    
}
