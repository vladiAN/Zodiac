//
//  ProfileView.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 09.06.2023.
//

import SwiftUI

struct ProfileView: View {
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
                                
                Image("leo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                
                Button(action: {
                    
                }) {
                        Text("Read the description")
                            .frame(width: 200, height: 28)
                            .padding()
                            .background(Color.secondColorForGradient)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.all)
                    
                }
//                .fullScreenCover(isPresented: $viewModel.showCompatibilityScreen) {
//                    NavigationView {
//                        CompatibilityListView(content: viewModel.compatibilities,
//                                              fistSign: viewModel.firstSignImage,
//                                              secondSign: viewModel.secondSignImage)
//                        .navigationBarItems(leading: Button(action: {
//                            viewModel.showCompatibilityScreen = false
//                        }) {
//                            Image(systemName: "chevron.backward")
//                            Text("Back")
//                        })
//                    }
//                }


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
                    
                }) {
                        Text("Check info")
                            .frame(width: 150, height: 28)
                            .padding()
                            .background(Color.firstColorForGradient)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.all)
                    
                }
                
                Spacer()
                
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
                .fullScreenCover(isPresented: $isDeleletProfile, content: {
                    FirstScreenView()
                })
                
                Spacer()
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
