//
//  NumerologyView.swift
//  Zodiac
//
//  Created by Алина Андрушок on 06.06.2023.
//

import Foundation
import SwiftUI

struct NumerologyView: View {
    @StateObject private var viewModel = NumerologyViewModel()
    
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
                    .padding(.top, 10)
                    .frame(height: viewModel.isNumberReceived ? 0 : 1)
                    .opacity(viewModel.isNumberReceived ? 0 : 1)
                
                
                DatePicker("", selection: $viewModel.birthDate, in: ...Date(), displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .colorInvert()
                    .frame(height: viewModel.isNumberReceived ? 0 : 400)
                    .opacity(viewModel.isNumberReceived ? 0 : 1)
                
                Button(action: {
                    
                    if viewModel.isNumberReceived {
                        withAnimation(.easeInOut(duration: 1)) {
                            viewModel.isNumberReceived.toggle()
                        }
                    } else {
                        viewModel.isNumerologyDataLoading = true
                        viewModel.calculateDestinyNumber()
                        viewModel.fetchNumerology()
                        withAnimation(.easeInOut(duration: 1)) {
                            viewModel.isNumberReceived.toggle()
                        }
                    }
                }) {
                    Text(viewModel.isNumberReceived ? "Сalculate new fate number" : "Сalculate fate number")
                        .frame(width: 250, height: 28)
                        .padding()
                        .background(viewModel.isNumberReceived ? Color.secondColorForGradient : Color.firstColorForGradient)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                if viewModel.isNumberReceived {
                    GeometryReader { proxy in
                        VStack {
                            Text("You fate number")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding(.top, 30)
                            
                            Image(viewModel.destinyNumberImage)
                                .resizable()
                                .frame(width: 70, height: 70)
                                .aspectRatio(contentMode: .fit)
                                .padding(.top, 30)
                            
                            ScrollView {
                                DisclosureGroup(
                                    content: {
                                        ScrollView {
                                            Text(viewModel.numerology?.desc ?? "")
                                                .padding(.horizontal, 5)
                                                .padding()
                                                .foregroundColor(Color.black)
                                                .multilineTextAlignment(.leading)
                                        }
                                    },
                                    label: {
                                        Text("Descryption number")
                                            .font(.headline)
                                            .foregroundColor(Color.black)
                                            .padding(.horizontal, 5)
                                            .multilineTextAlignment(.leading)
                                    }
                                )
                                .padding(.all, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.white)
                                )
                                .padding(.horizontal)
                                .padding(.top, 30)
                            }
                            .padding(.bottom, 26)
                        }
                    }
                }
            }
        }
    }
}

struct NumerologyView_Previews: PreviewProvider {
    static var previews: some View {
        NumerologyView()
    }
}
