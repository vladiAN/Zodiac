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
                .foregroundColor(Color.white)

            
            
            Text("Choose your zodiac signs between which we will check compatibility").italic()
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .frame(width: UIScreen.main.bounds.width / 1.4)
                .padding(.top, 50)
            
            HStack {
                VStack {
                    Button(action: {
                        openDatePicker(for: .firstSign)
                    }) {
                        Image(viewModel.firstSignImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .disabled(viewModel.isFirstButtonDisabled)
                    
                    Text(viewModel.firstSignName)
                        .foregroundColor(Color.white)

                }
                
                Image("hearts")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 25)
                
                VStack{
                    Button(action: {
                        openDatePicker(for: .secondSign)
                    }) {
                        Image(viewModel.secondSignImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .disabled(viewModel.isSecondButtonDisabled)
                    
                    Text(viewModel.secondSignName)
                        .foregroundColor(Color.white)

                }
                
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top, 70)
            
            Spacer()
            Button(action: {
                viewModel.isDataLoading = true
                viewModel.fetchCompatibility()
            }) {
                if viewModel.isDataLoading {
                    ProgressView()
                        .frame(width: 185, height: 28)
                        .padding()
                        .background(Color.firstColorForGradient)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                } else {
                    Text("Check Compatibility")
                        .frame(width: 185, height: 28)
                        .padding()
                        .background(Color.firstColorForGradient)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .disabled(viewModel.firstSignImage == "plus" || viewModel.secondSignImage == "plus")
            .opacity((viewModel.firstSignImage == "plus" || viewModel.secondSignImage == "plus") ? 0.5 : 1.0)
            .padding(.bottom, 100)
            .sheet(isPresented: $viewModel.showCompatibilityScreen) {
                CompatibilityListView(content: viewModel.compatibilities)
            }
            
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
            if viewModel.selectedSign == .firstSign {
                DatePickerView(continueButtonTapped: { zodiacSignImageName in
                    viewModel.continueButtonTapped(zodiacSignImageName: zodiacSignImageName, for: .firstSign)
                })
            } else if viewModel.selectedSign == .secondSign {
                DatePickerView(continueButtonTapped: { zodiacSignImageName in
                    viewModel.continueButtonTapped(zodiacSignImageName: zodiacSignImageName, for: .secondSign)
                })
            }
        }
    }
    
    func openDatePicker(for sign: SelectedSign) {
        if sign == .firstSign {
            viewModel.selectedSign = .firstSign
            viewModel.showDatePickerView = true
            viewModel.isFirstButtonDisabled = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                viewModel.isFirstButtonDisabled = false
            }
        } else if sign == .secondSign {
            viewModel.selectedSign = .secondSign
            viewModel.showDatePickerView = true
            viewModel.isSecondButtonDisabled = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                viewModel.isSecondButtonDisabled = false
            }
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

