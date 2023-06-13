//
//  Extention+Date.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 13.06.2023.
//

import Foundation

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
