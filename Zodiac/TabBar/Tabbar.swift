//
//  Tabbar.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 08.06.2023.
//

import SwiftUI

struct Tabbar: View {
    @StateObject var viewModel = TabbarViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.selectedTab) {
                NumerologyView()
                    .tag("Numerology")
                HoroscopeView()
                    .tag("Horoscope")
                CompatibilityView()
                    .tag("Compatibility")
                ProfileView()
                    .tag("Profile")
            }
            
            
            HStack() {
                ForEach(viewModel.tabs, id: \.self) { tab in
                    Spacer()
                    TabBarItem(tab: tab, selectedTab: $viewModel.selectedTab)
                    Spacer()
                }
            }
            .padding(.top, 15)
            .padding(.bottom, 15)
            .frame(width: UIScreen.main.bounds.width, height: 75)
            .background(Color.firstColorForGradient)
            
        }
        
    }
}


struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
