//
//  OnboardingThirdView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/24/25.
//

import SwiftUI

struct OnboardingThirdView: View {
    var body: some View {
        ZStack {
            Image(Asset.Onboarding.third)
                .resizable()
                .frame(width: 634.89, height: 760.8)
                .offset(x: 120, y: 125)
            VStack {
                Spacer()
                    .frame(height: 100)
                HStack {
                    Text("난")
                    Text("DG고새")
                        .foregroundColor(.p[500])
                    Text("라고해!")
                }
                .textStyle(TextStyle.title1.bold)
                Text("앞으로 잘부탁해.")
                    .textStyle(TextStyle.title1.bold)
                Spacer()
                VStack {
                    MGButton (
                        title: "잘 부탁해!",
                        type: .enabled,
                        size: .medium,
                        color: .dark,
                        action: {}
                    )
                    MGButton (
                        title: "뭐야 이 징그러운건;",
                        type: .enabled,
                        size: .medium,
                        color: .light,
                        action: {}
                    )
                }
                .frame(width: 333)
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    OnboardingThirdView()
}
