//
//  OnboardingFourth1verView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/24/25.
//

import SwiftUI

struct OnboardingFourth1verView: View {
    @State private var next: Bool = false
    
    var body: some View {
        ZStack {
            Image(Asset.Onboarding.fourth.ver1)
                .resizable()
                .frame(width: 491, height: 691)
                .offset(y: 170)
            VStack {
                Spacer()
                    .frame(height: 100)
                Text("너무하네.. 정말...")
                    .textStyle(TextStyle.title1.bold)
                Text("그래도 먹고갈래는 해줄꺼지?")
                    .textStyle(TextStyle.title1.bold)
                Spacer()
                MGButton (
                    title: "당연하지!",
                    type: .enabled,
                    size: .medium,
                    color: .dark,
                    action: {
                        next = true
                    }
                )
            }
            .frame(width: 333)
            .padding(.bottom)
            NavigationLink(destination: OnboardingFourth2verView(), isActive: $next) {
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingFourth1verView()
}
