//
//  TabBarViewModel.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 09.06.2023.
//

import SwiftUI

class TabbarViewModel: ObservableObject {
    @Published var selectedTab = "Horoscope"
    
    let tabs = ["Numerology", "Horoscope", "Compatibility", "Profile"]
    
    func tabSelected(_ tab: String) {
        selectedTab = tab
    }
}
