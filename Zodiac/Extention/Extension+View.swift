//
//  Extension+View.swift
//  Zodiac
//
//  Created by Андрушок on 30.05.2023.
//

import Foundation
import SwiftUI

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

struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct ClearBackgroundViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(ClearBackgroundView())
    }
}

extension View {
    func halfSheet<SheetContent: View>(showSheet: Binding<Bool>, @ViewBuilder sheetContent: @escaping () -> SheetContent) -> some View {
        self.modifier(HalfSheetModifier(showSheet: showSheet, sheetContent: sheetContent))
    }
}

extension View {
    func clearModalBackground() -> some View {
        self.modifier(ClearBackgroundViewModifier())
    }
}
