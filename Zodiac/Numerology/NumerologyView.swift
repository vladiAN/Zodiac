//
//  NumerologyView.swift
//  Zodiac
//
//  Created by Алина Андрушок on 06.06.2023.
//

import Foundation
import SwiftUI

struct NumerologyView: View {
    @StateObject private var viewModel: NumerologyViewModel = NumerologyViewModel()
    
    var body: some View {
        ZStack{
            
            LinearGradient(
                gradient: Gradient(colors: [Color.firstColorForGradient, Color.secondColorForGradient]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("State the date of birth")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                
                DatePicker("", selection: $viewModel.birthDate, displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .padding()
                    .colorInvert()
                
                Button(action: {
                    viewModel.isNumerologyDataLoading = true
                    viewModel.calculateDestinyNumber()
                    viewModel.fetchNumerology()
                }) {
                    if viewModel.isNumerologyDataLoading {
                        ProgressView()
                            .frame(width: 250, height: 28)
                            .padding()
                            .background(Color.firstColorForGradient)
                            .cornerRadius(10)
                            .tint(.white)
                    } else {
                        Text("Сalculate your fate number")
                            .frame(width: 250, height: 28)
                            .padding()
                            .background(Color.firstColorForGradient)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }
}

struct NumerologyView_Previews: PreviewProvider {
    static var previews: some View {
        NumerologyView()
    }
}
