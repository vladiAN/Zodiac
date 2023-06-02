//
//  Extension+View.swift
//  Zodiac
//
//  Created by Андрушок on 30.05.2023.
//

import Foundation
import SwiftUI

extension View {
    func halfSheet<SheetContent: View>(showSheet: Binding<Bool>, @ViewBuilder sheetContent: @escaping () -> SheetContent) -> some View {
        self.modifier(HalfSheetModifier(showSheet: showSheet, sheetContent: sheetContent))
    }
}

struct HalfSheetModifier<SheetContent: View>: ViewModifier {
    @Binding var showSheet: Bool
    let sheetContent: () -> SheetContent
    
    @ViewBuilder
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if showSheet {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showSheet = false
                        }
                    }
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    sheetContent()
                        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 2/3)
                        .background(Color.white)
                        .cornerRadius(10)
                        .edgesIgnoringSafeArea(.bottom)
                }
                .edgesIgnoringSafeArea(.bottom)
                .onTapGesture {}
            }
        }
    }
}
