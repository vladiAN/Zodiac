//
//  ZodiacApp.swift
//  Zodiac
//
//  Created by Андрушок on 30.05.2023.
//

import SwiftUI

@main
struct ZodiacApp: App {
    var body: some Scene {
        WindowGroup {
            NumerologyView()
                .attachPartialSheetToRoot()
        }
    }
}
