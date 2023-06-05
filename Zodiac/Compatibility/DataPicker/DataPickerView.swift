//
//  DataPickerView.swift
//  Zodiac
//
//  Created by Андрушок on 31.05.2023.
//

import SwiftUI

struct DatePickerView: View {
    @ObservedObject var viewModel = DatePickerViewModel()
    
    let continueButtonTapped: (String) -> Void
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Pick date of Birth")
            
            Image(viewModel.zodiacSignImageName ?? "leo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            DatePicker("", selection: $viewModel.selectedDate, displayedComponents: [.date])
                .labelsHidden()
                .datePickerStyle(.wheel)
                .padding()
            
            Button(action: {
                continueButtonTapped(viewModel.zodiacSignImageName ?? "plus")
            }) {
                HStack {
                    Text("Continue")
                    Image(systemName: "arrow.right")
                }
                .padding()
                .background(Color.secondColorForGradient)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding(.bottom, 20)
            .padding()
        }
        .background(Color.firstColorForGradient)
        .onChange(of: viewModel.selectedDate, perform: { _ in
            viewModel.updateZodiacSign()
        })
            .frame(height: UIScreen.main.bounds.height * 2/3)
    }

}


struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}