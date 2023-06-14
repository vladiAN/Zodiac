//
//  HoroscopeView.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 09.06.2023.
//

import SwiftUI

struct HoroscopeView: View {
    @StateObject private var viewModel = HoroscopeViewModel()
    @State private var profileImageName: String = ""
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [Color.firstColorForGradient, Color.secondColorForGradient]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)

            
            VStack {
//                Image(profileImageName)
                Image("gemini")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                .padding(.top)
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Text("Get horoscope for \(profileImageName.uppercased())")
                        .padding()
                        .background(Color.secondColorForGradient)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                Button {
                    viewModel.isAllHoroscopeDataLoading = true
                    viewModel.fetchHoroscopeData()
                } label: {
                    if viewModel.isAllHoroscopeDataLoading {
                        ProgressView()
                            .frame(width: 200, height: 28)
                            .padding()
                            .background(Color.firstColorForGradient)
                            .cornerRadius(10)
                            .tint(.white)
                            .padding(.all)
                    } else {
                        Text("Get horoscope for all signs")
                            .frame(width: 200, height: 28)
                            .padding()
                            .background(Color.firstColorForGradient)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        .onAppear {
            if let imageName = UserDefaults.standard.string(forKey: "imageNameForProfile") {
                profileImageName = imageName
            }
        }
    }
}

struct HoroscopeView_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeView()
    }
}
