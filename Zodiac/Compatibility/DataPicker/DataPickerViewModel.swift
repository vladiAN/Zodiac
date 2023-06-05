//
//  DataPickerViewModel.swift
//  Zodiac
//
//  Created by Андрушок on 31.05.2023.
//

import Foundation

class DatePickerViewModel: ObservableObject {
    private var initialSelectedDate: Date?
    
    @Published var zodiacSignImageName: String?
    @Published var selectedDate: Date {
               didSet {
                       initialSelectedDate = selectedDate
               }
           }

    init() {
        if let initialDate = initialSelectedDate {
            selectedDate = initialDate
        } else {
            selectedDate = Date()
            initialSelectedDate = selectedDate
        }
        
        updateZodiacSign()
    }

    
    func updateZodiacSign() {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .day], from: selectedDate)
        if let month = components.month, let day = components.day {
                
                switch (month, day) {
                case (1, 20...31), (2, 1...18):
                    zodiacSignImageName = "aquarius"
                case (2, 19...29), (3, 1...20):
                    zodiacSignImageName = "pisces"
                case (3, 21...31), (4, 1...19):
                    zodiacSignImageName = "aries"
                case (4, 20...30), (5, 1...20):
                    zodiacSignImageName = "taurus"
                case (5, 21...31), (6, 1...20):
                    zodiacSignImageName = "gemini"
                case (6, 21...30), (7, 1...22):
                    zodiacSignImageName = "cancer"
                case (7, 23...31), (8, 1...22):
                    zodiacSignImageName = "leo"
                case (8, 23...31), (9, 1...22):
                    zodiacSignImageName = "virgo"
                case (9, 23...30), (10, 1...22):
                    zodiacSignImageName = "libra"
                case (10, 23...31), (11, 1...21):
                    zodiacSignImageName = "scorpio"
                case (11, 22...30), (12, 1...21):
                    zodiacSignImageName = "sagittarius"
                case (12, 22...31), (1, 1...19):
                    zodiacSignImageName = "capricorn"
                default:
                    zodiacSignImageName = "aquarius"
                }
        } else {
            print("Incorrect Date")
        }
        
        
    }
}
