//
//  AllHoroscopeView.swift
//  Zodiac
//
//  Created by Vladislav Andrushok on 14.06.2023.
//

import SwiftUI

struct AllHoroscopeView: View {
    @StateObject private var viewModel = HoroscopeViewModel()
    @State var horoscope: Horoscope?
    let zodiacSigns: [String] = ["Aquarius", "Aries", "Cancer", "Capricorn", "Gemini", "Leo", "Libra", "Pisces", "Sagittarius", "Scorpio", "Taurus", "Virgo"]
    
    let zodiacSignsDict: [String: KeyPath<HoroscopePayload, String>] = [
        "Aquarius": \.aquarius,
        "Aries": \.aries,
        "Cancer": \.cancer,
        "Capricorn": \.capricorn,
        "Gemini": \.gemini,
        "Leo": \.leo,
        "Libra": \.libra,
        "Pisces": \.pisces,
        "Sagittarius": \.sagittarius,
        "Scorpio": \.scorpio,
        "Taurus": \.taurus,
        "Virgo": \.virgo
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.firstColorForGradient, Color.secondColorForGradient]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                ForEach(zodiacSigns, id: \.self) { sign in
                    DisclosureGroup(content: {
                        if let horoscope = horoscope?.payload,
                           let keyPath = zodiacSignsDict[sign] {
                            Text(horoscope[keyPath: keyPath])
                                .padding()
                        } else {
                            Text("")
                        }
                    }, label: {
                        Text(sign).bold()
                            .foregroundColor(.black)
                    })
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
        }
    }
}

