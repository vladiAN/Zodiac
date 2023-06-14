//
//  HoroscopeViewModel.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 13.06.2023.
//

import Foundation

enum SelectedButton {
    case profileHoroscope
    case allHoroscope
}

class HoroscopeViewModel: ObservableObject {
    @Published var horoscope: Horoscope?
    @Published var isDProfileHoroscopeDataLoading = false
    @Published var isAllHoroscopeDataLoading = false
    @Published var showProfileHoroscopeScreen = false
    @Published var showAllHoroscopeScreen = false
    @Published var selectedButton: SelectedButton = .profileHoroscope
    
    func fetchHoroscopeData(for button: SelectedButton) {
        NetworkManager.shared.fetchHoroscope { (result) in
            switch result {
            case .success(let horoscope):
                if button == .profileHoroscope {
                    DispatchQueue.main.async {
                        self.horoscope = horoscope
                        
                        self.isDProfileHoroscopeDataLoading = false
                        self.showProfileHoroscopeScreen = true
                        
                    }
                } else if button == .allHoroscope{
                    DispatchQueue.main.async {
                        self.horoscope = horoscope
                        
                        self.isAllHoroscopeDataLoading = false
                        self.showAllHoroscopeScreen = true
                    }
                }
            case .failure(let error):
                print("Error fetching horoscope data: \(error)")
            }
        }
    }
    
    func getHoroscopeText(for imageName: String) -> String {
        guard let horoscope = horoscope?.payload else {
            return ""
        }
        
        switch imageName.lowercased() {
        case "aquarius": return horoscope.aquarius
        case "aries": return horoscope.aries
        case "cancer": return horoscope.cancer
        case "capricorn": return horoscope.capricorn
        case "gemini": return horoscope.gemini
        case "leo": return horoscope.leo
        case "libra": return horoscope.libra
        case "pisces": return horoscope.pisces
        case "sagittarius": return horoscope.sagittarius
        case "scorpio": return horoscope.scorpio
        case "taurus": return horoscope.taurus
        case "virgo": return horoscope.virgo
        default: return ""
        }
    }


}
