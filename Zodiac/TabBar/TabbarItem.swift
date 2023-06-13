//
//  TabbarItem.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 09.06.2023.
//

import SwiftUI

struct TabBarItem: View {
    let tab: String
    @Binding var selectedTab: String
    
    var body: some View {
        if tab == "Profile" {
            Button(action: {
                withAnimation(.spring()) {
                    selectedTab = tab
                }
            }) {
                ZStack {
                    Circle()
                        .frame(width: 39, height: 39)
                        .foregroundColor(selectedTab == tab ? .white : Color.secondColorForGradient)
                    
                    Image(UserDefaults.standard.string(forKey: "imageNameForProfile")!)
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
        } else {
            Button(action: {
                withAnimation(.spring()) {
                    selectedTab = tab
                }
            }) {
                HStack {
                    Image(tab)
                        .resizable()
                        .frame(width: 30, height: 30)
                    if selectedTab == tab {
                        Text(tab)
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                    }
                }
            }
            .opacity(selectedTab == tab ? 1 : 0.7)
            .padding(.vertical, 10)
            .padding(.horizontal, 17)
            .background(selectedTab == tab ? .white : Color.firstColorForGradient)
            .clipShape(Capsule())
        }
    }
}
