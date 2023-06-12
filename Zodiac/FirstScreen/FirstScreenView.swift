//
//  FirstScreenView.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 09.06.2023.
//

import SwiftUI

struct FirstScreenView: View {
    @ObservedObject var viewModel = FirstScreenViewModel()
    @State private var isAppPresented = false
    
    
    var body: some View {
        ZStack {
            
            Color.firstColorForGradient
            
            VStack {
                Spacer()
                Text("What's your\nDate of Birth?").bold()
                    .lineLimit(2)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
                Image(Calendar.current.updateZodiacSign(for: viewModel.selectedDate) ?? "leo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .padding()
                
                DatePicker("", selection: $viewModel.selectedDate, in: ...Date(), displayedComponents: [.date])
                    .labelsHidden()
                    .datePickerStyle(.wheel)
                    .padding()
                    .colorInvert()
                
                
                Button(action: {
                    isAppPresented = true
                }) {
                    HStack {
                        Text("Continue")
                        Image(systemName: "arrow.right")
                    }
                    .padding()
                    .background(Color.secondColorForGradient)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .fullScreenCover(isPresented: $isAppPresented, content: {
                        Tabbar()
                    })
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
    
}


struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView()
    }
}
