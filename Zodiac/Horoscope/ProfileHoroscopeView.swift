//
//  ProfileHoroscopeView.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 14.06.2023.
//

import SwiftUI

struct ProfileHoroscopeView: View {
    @State var horoscope: String
    @State var profileImageName: String
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.firstColorForGradient, Color.secondColorForGradient]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Image("\(profileImageName)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                .padding(.top)
                
                ScrollView {
                    Text("\(horoscope)")
                        .foregroundColor(Color.black)
                        .font(.headline)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding()
                }
            }
            
        }
    }
}
