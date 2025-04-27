//
//  OnboardingThirdView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/24/25.
//

import SwiftUI

struct OnboardingThirdView: View {
    @State private var next1: Bool = false
    @State private var next2: Bool = false
    
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
                        action: {
                            next1 = true
                        }
                    )
                        MGButton (
                            title: "뭐야 이 징그러운건;",
                            type: .enabled,
                            size: .medium,
                            color: .light,
                            action: {
                                next2 = true
                            }
                        )
                }
                .frame(width: 333)
                .padding(.bottom)
                NavigationLink(destination: OnboardingFourth2verView(), isActive: $next1) {
                    EmptyView()
                }
                NavigationLink(destination: OnboardingFourth1verView(), isActive: $next2) {
                    EmptyView()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingThirdView()
}
