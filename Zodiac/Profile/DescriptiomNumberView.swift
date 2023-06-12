//
//  DescriptiomNumberView.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 12.06.2023.
//

import SwiftUI

struct DescriptiomNumberView: View {
    @State var descriptionNumber: Numerology
    
    var body: some View {
        ZStack{
            
            LinearGradient(
                gradient: Gradient(colors: [Color.firstColorForGradient, Color.secondColorForGradient]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                Text("\(descriptionNumber.desc)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                    .multilineTextAlignment(.leading)
            }
            
            
        }
        .navigationTitle("Fate number: \(descriptionNumber.number)")
    }
}

