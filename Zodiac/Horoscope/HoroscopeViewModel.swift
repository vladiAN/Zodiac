//
//  HoroscopeViewModel.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 13.06.2023.
//

import Foundation

class HoroscopeViewModel: ObservableObject {
    @Published var horoscope: Horoscope?
    @Published var isDProfileHoroscopeDataLoading = false
    @Published var isAllHoroscopeDataLoading = false
    @Published var showProfileHoroscopeScreen = false
    @Published var showAllHoroscopeScreen = false
    
    func fetchHoroscopeData() {
        NetworkManager.shared.fetchHoroscope { (result) in
            switch result {
            case .success(let horoscope):
                DispatchQueue.main.async {
                    self.horoscope = horoscope
                    self.isAllHoroscopeDataLoading = false
                    self.showAllHoroscopeScreen = true
                    print(horoscope.payload.aquarius)
                }
            case .failure(let error):
                print("Error fetching horoscope data: \(error)")
            }
        }
    }


}
