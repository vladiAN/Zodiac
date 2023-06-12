//
//  ProfileView.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 09.06.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State var isDeleletProfile = false
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [Color.firstColorForGradient, Color.secondColorForGradient]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                

                Text("Your zodiac sing: SignName").bold()
                    .foregroundColor(.white)
                    .font(.system(size: 23))
                    .padding(.top, 10)
                                
                Image("leo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                
                Button(action: {
                    viewModel.isDescriptionDataLoading = true
                    viewModel.fetchDescriptionSign()
                }) {
                    
                    if viewModel.isDescriptionDataLoading {
                        ProgressView()
                            .frame(width: 200, height: 28)
                            .padding()
                            .background(Color.secondColorForGradient)
                            .cornerRadius(10)
                            .tint(.white)
                            .padding(.all)
                        
                    } else {
                        Text("Read the description")
                            .frame(width: 200, height: 28)
                            .padding()
                            .background(Color.secondColorForGradient)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.all)
                    }
                    
                }
                .fullScreenCover(isPresented: $viewModel.showDescriptionSignScreen) {
                    NavigationView {
                        DescriptionSignView(descriptionSign: viewModel.descriptionSign! )
                            .navigationBarItems(leading: Button(action: {
                                viewModel.showDescriptionSignScreen = false
                            }) {
                                Image(systemName: "chevron.backward")
                                Text("Back")
                            })
                    }
                }


                Text("You fate number").bold()
                    .foregroundColor(.white)
                    .font(.system(size: 23))
                    .padding(.all)
                
                Image("one")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .padding(.all)
                
                Button(action: {
                    viewModel.isNumerologyDataLoading = true
                    viewModel.fetchNumerology()
                }) {
                    if viewModel.isNumerologyDataLoading{
                        ProgressView()
                            .frame(width: 150, height: 28)
                            .padding()
                            .background(Color.firstColorForGradient)
                            .cornerRadius(10)
                            .tint(.white)
                            .padding(.all)
                    } else {
                        Text("Check info")
                            .frame(width: 150, height: 28)
                            .padding()
                            .background(Color.firstColorForGradient)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.all)
                    }
                    
                }
                .fullScreenCover(isPresented: $viewModel.showDescriptionNumberScreen) {
                    NavigationView {
                        DescriptiomNumberView(descriptionNumber: viewModel.descriptionNumber! )
                            .navigationBarItems(leading: Button(action: {
                                viewModel.showDescriptionNumberScreen = false
                            }) {
                                Image(systemName: "chevron.backward")
                                Text("Back")
                            })
                    }
                }
                
                Button(action: {
                    isDeleletProfile = true
                }) {
                        Text("Delete profile")
                            .frame(width: 200, height: 20)
                            .padding()
                            .background( .red )
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    
                }
                .padding(.bottom, 50)
                .fullScreenCover(isPresented: $isDeleletProfile, content: {
                    FirstScreenView()
                })
                
                
            }
        }
    }
}
    

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
