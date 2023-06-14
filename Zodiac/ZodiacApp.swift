//
//  ZodiacApp.swift
//  Zodiac
//
//  Created by Андрушок on 30.05.2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct ZodiacApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            FirstScreenView()            
                .attachPartialSheetToRoot()
        }
    }
}

class NavigationHelper: ObservableObject {
    
    @Published var showNextView = false
    
}
