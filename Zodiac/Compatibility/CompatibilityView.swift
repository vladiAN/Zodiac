//
//  CompatibilityView.swift
//  Zodiac
//
//  Created by Андрушок on 30.05.2023.
//

import SwiftUI
import PartialSheet

struct ContentView: View {
    @StateObject private var viewModel = CompatibilityViewModel()
    
    
    var body: some View {
        
        
        VStack {
            
            Text("Compatibility").bold()
            
            
            Text("Choose your zodiac signs between which we will check compatibility").italic()
                .multilineTextAlignment(.center)
                .frame(width: UIScreen.main.bounds.width / 1.4)
                .padding(.top, 50)
            
            HStack {
                VStack {
                    Button(action: {
                        viewModel.showDatePickerView = true
                    }) {
                        Image(viewModel.firstSignImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    Text(viewModel.firstSignName)
                }
                
                Image("hearts")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 25)
                
                VStack{
                    Button(action: {
                        viewModel.showDatePickerView = true
                    }) {
                        Image(viewModel.secondSignImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    Text(viewModel.secondSignName)
                }
                
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top, 70)
            
            Spacer()
            Button(action: {
                
            }) {
                Text("Check Compatibility")
                    .padding()
                    .background(Color.firstColorForGradient)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.bottom, 100)
            
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.firstColorForGradient, Color.secondColorForGradient]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
        )
        .partialSheet(isPresented: $viewModel.showDatePickerView,
                      iPhoneStyle: .init(background: .solid(Color.firstColorForGradient),
                                         handleBarStyle: .solid(Color.secondary),
                                         cover: .enabled(Color.black.opacity(0.4)),
                                         cornerRadius: 10)) {
            DatePickerView(continueButtonTapped: viewModel.continueButtonTapped)
        }
    }
}
                      

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//            ScrollView {
//                ForEach(viewModel.compatibilities, id: \.header) { compatibility in
//                    VStack(alignment: .leading) {
//                        Text(compatibility.header)
//                            .font(.headline)
//                            .padding(.vertical, 2)
//                        Text(compatibility.text)
//                            .padding(.bottom, 4)
//                    }
//                    .padding(.horizontal)
//                }
//            }
//        }
//    }


