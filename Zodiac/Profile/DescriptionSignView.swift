//
//  DescriptionSignView.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 11.06.2023.
//

import SwiftUI

struct DescriptionSignView: View {
    @State private var isExpanded = false
    @State var descriptionSign: DescriptionSign
    
    var body: some View {
        ScrollView {
            ForEach(descriptionSign.sections, id: \.self) { section in
                DisclosureGroup(
                    content: {
                        ScrollView {
                            Text(section.value)
                                .padding(.all, 10)
                                .padding(.horizontal, 5)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.leading)
                        }
                    },
                    label: {
                        Text(section.title)
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
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.firstColorForGradient, Color.secondColorForGradient]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
        )
        .navigationTitle("Sign Description")
    }
}

struct DescriptionSignView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
