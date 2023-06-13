//
//  CompatibilityListView.swift
//  Zodiac
//
//  Created by Алина Андрушок on 05.06.2023.
//

import SwiftUI

struct CompatibilityListView: View {
    @State var content: [Compatibility]
    @State var fistSign: String
    @State var secondSign: String
    
    var body: some View {
        VStack {
            HStack {
                Image(fistSign)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(x: -1, y: 1)
                
                Image("hearts")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                
                Image(secondSign)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .aspectRatio(contentMode: .fit)
            }
            .padding(.top, 20)
            
            ScrollView {
                ForEach(content, id: \.header) { compatibility in
                    DisclosureGroup(
                        content: {
                            ScrollView {
                                Text(compatibility.text)
                                    .padding(.horizontal, 5)
                                    .padding(.all, 10)
                                    .foregroundColor(Color.black)
                            }
                        },
                        label: {
                            Text(compatibility.header)
                                .foregroundColor(Color.black)
                                .font(.headline)
                                .padding(.horizontal, 5)
                                .multilineTextAlignment(.leading)
                        }
                    )
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.white)
                            .padding(.horizontal, -5)
                    )
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                }
            }
            .padding(.top, 10)
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.firstColorForGradient, Color.secondColorForGradient]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
        )
    }
}
