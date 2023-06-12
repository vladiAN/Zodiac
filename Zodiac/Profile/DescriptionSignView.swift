//
//  DescriptionSignView.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 11.06.2023.
//

import SwiftUI

struct DescriptionSignView: View {
    @State var content: [DescriptionSign]
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [Color.firstColorForGradient, Color.secondColorForGradient]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
//            ScrollView {
//                ForEach(content, id: \.header) { content in
//                    DisclosureGroup(
//                        content: {
//                            ScrollView {
//                                Text(content.text)
//                                    .padding(.horizontal, 5)
//                                    .foregroundColor(Color.black)
//
//                            }
//                        },
//                        label: {
//                            Text(compatibility.header)
//                                .foregroundColor(Color.black)
//                                .font(.headline)
//                                .padding(.horizontal, 5)
//                                .multilineTextAlignment(.leading)
//                        }
//                    )
//                    .padding(.vertical, 8)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .foregroundColor(Color.white)
//                            .padding(.horizontal, -5)
//                    )
//                    .padding(.horizontal)
//                    .padding(.bottom, 8)
//                }
//            }
//            .padding(.top, 10)

        }
    }
}

//struct DescriptionSignView_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionSignView()
//    }
//}
