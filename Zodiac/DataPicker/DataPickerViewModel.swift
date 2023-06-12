//
//  DataPickerViewModel.swift
//  Zodiac
//
//  Created by Андрушок on 31.05.2023.
//

import Foundation

class DatePickerViewModel: ObservableObject {
    @Published var selectedDate: Date
    
    init() {
        selectedDate = Date()
    }
}

