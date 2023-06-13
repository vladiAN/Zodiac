//
//  FirstScreenView.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 09.06.2023.
//

import SwiftUI

struct FirstScreenView: View {
    @ObservedObject var viewModel = FirstScreenViewModel()
    @StateObject var navigation = NavigationHelper()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.firstColorForGradient
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Spacer()
                                        
                    Text("What's your Date of Birth?").bold()
                        .lineLimit(2)
                        .font(.system(size: 28))
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.5)
                        .padding(.top, 10)
                    
                    Image(Calendar.current.updateZodiacSign(for: viewModel.selectedDate) ?? "leo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .padding(.top)
                    
                    DatePicker("", selection: $viewModel.selectedDate, in: ...Date(), displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                        .padding()
                        .colorInvert()
                    
                    NavigationLink(isActive: $navigation.showNextView) {
                        Tabbar()
                            .environmentObject(navigation)
                    } label: {
                        HStack {
                            Text("Continue")
                            Image(systemName: "arrow.right")
                        }
                        .padding()
                        .background(Color.secondColorForGradient)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        viewModel.saveSelectedDate()
                        viewModel.saveImageNameForProfile()
                    })
                    
                    Spacer()
                }
            }
        }
    }
}


struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView()
    }
}
