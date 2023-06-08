//
//  Tabbar.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 08.06.2023.
//

import SwiftUI

struct Tabbar: View {
    @State var selectTab = "Numerology"
    
    let tabs = ["Numerology", "Horoscope", "Compatibility", "Profile"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $selectTab) {
                NumerologyView()
                    .tag("Numerology")
                Text("Horoscope")
                    .tag("Horoscope")
                CompatibilityView()
                    .tag("Compatibility")
                Text("Profile")
                    .tag("Profile")
            }
            
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    Spacer()
                    TabBarItem(tab: tab, selected: $selectTab)
                    Spacer()
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 5)
            .frame(maxWidth: .infinity)
            .background(Color.firstColorForGradient)
        }
    }
}

struct TabBarItem: View {
    @State var tab: String
    @Binding var selected: String
    
    var body: some View {
        if tab == "Profile" {
            Button {
                withAnimation(.spring()) {
                    selected = tab
                }
            } label: {
                ZStack {
                    Circle()
                        .frame().frame(width: 39, height: 39)
                        .foregroundColor(selected == tab ? .white : Color.secondColorForGradient)
                    
                    Image("leo")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
        } else {
            ZStack {
                Button {
                    withAnimation(.spring()) {
                        selected = tab
                    }
                    
                } label: {
                    HStack {
                        Image(tab)
                            .resizable()
                            .frame(width: 30, height: 30)
                        if selected == tab {
                            Text(tab)
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .opacity(selected == tab ? 1 : 0.7)
            .padding(.vertical, 10)
            .padding(.horizontal, 17)
            .background(selected == tab ? .white : Color.firstColorForGradient)
            .clipShape(Capsule())
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
