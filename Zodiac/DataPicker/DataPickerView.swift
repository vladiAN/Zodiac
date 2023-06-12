//
//  DataPickerView.swift
//  Zodiac
//
//  Created by Андрушок on 31.05.2023.
//

import SwiftUI

struct DatePickerView: View {
    @ObservedObject var viewModel = DatePickerViewModel()
    @State var isFirstSign: Bool
    
    let continueButtonTapped: (String) -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Pick date of Birth")
                .foregroundColor(.white)
            
            if isFirstSign {
                Image(Calendar.current.updateZodiacSign(for: viewModel.selectedDate) ?? "leo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(x: -1, y: 1)
                    .padding()

            } else {
                Image(Calendar.current.updateZodiacSign(for: viewModel.selectedDate) ?? "leo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            

            DatePicker("", selection: $viewModel.selectedDate, in: ...Date(), displayedComponents: [.date])
                .labelsHidden()
                .datePickerStyle(.wheel)
                .colorInvert()
                
            
            Button(action: {
                continueButtonTapped(Calendar.current.updateZodiacSign(for: viewModel.selectedDate) ?? "plus")
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
        }
        .background(Color.firstColorForGradient)
        .frame(height: UIScreen.main.bounds.height * 2/3)
    }
}


struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        CompatibilityView()
    }
}
