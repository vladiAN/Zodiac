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
}
