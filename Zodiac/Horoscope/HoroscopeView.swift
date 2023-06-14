//
//  HoroscopeView.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 09.06.2023.
//

import SwiftUI

struct HoroscopeView: View {
    @StateObject private var viewModel = HoroscopeViewModel()
    @State private var profileImageName = UserDefaults.standard.string(forKey: "imageNameForProfile")!
    
    var body: some View {
        ZStack{
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
                
                Spacer()
                
                Button {
                    viewModel.isDProfileHoroscopeDataLoading = true
                    viewModel.fetchHoroscopeData(for: .profileHoroscope)
                } label: {
                    HStack {
                        Text("Get horoscope for \(profileImageName.uppercased())")
                            .frame(height: 28)
                        if viewModel.isDProfileHoroscopeDataLoading {
                            ProgressView()
                                .tint(.white)
                                .padding(.leading, 1)
                        } else {
                            Image(systemName: "arrow.right")
                        }
                    }
                    .padding()
                    .background(Color.secondColorForGradient)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
                .fullScreenCover(isPresented: $viewModel.showProfileHoroscopeScreen) {
                    NavigationView {
                        ProfileHoroscopeView(horoscope: viewModel.getHoroscopeText(for: profileImageName), profileImageName: profileImageName)
                            .navigationBarItems(leading: Button(action: {
                                viewModel.showProfileHoroscopeScreen = false
                            }) {
                                Image(systemName: "chevron.backward")
                                Text("Back")
                            })
                    }
                }
                
                Button {
                    viewModel.isAllHoroscopeDataLoading = true
                    viewModel.fetchHoroscopeData(for: .allHoroscope)
                } label: {
                    
                    HStack {
                        Text("Get horoscope for all signs")
                            .frame(width: 210, height: 28)
                        if viewModel.isAllHoroscopeDataLoading {
                            ProgressView()
                                .tint(.white)
                                .padding(.leading, 1)
                        } else {
                            Image(systemName: "arrow.right")
                        }
                    }
                    .padding()
                    .background(Color.firstColorForGradient)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
                .fullScreenCover(isPresented: $viewModel.showAllHoroscopeScreen) {
                    NavigationView {
                        AllHoroscopeView(horoscope: viewModel.horoscope ?? nil)
                            .navigationBarItems(leading: Button(action: {
                                viewModel.showAllHoroscopeScreen = false
                            }) {
                                Image(systemName: "chevron.backward")
                                Text("Back")
                            })
                    }
                }
                
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
