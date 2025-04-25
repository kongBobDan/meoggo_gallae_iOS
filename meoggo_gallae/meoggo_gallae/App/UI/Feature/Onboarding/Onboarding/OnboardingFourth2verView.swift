//
//  OnboardingFourth2verView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/24/25.
//

import SwiftUI

struct OnboardingFourth2verView: View {
    var body: some View {
        ZStack {
            Image(Asset.Onboarding.fourth.ver2)
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
                    action: {}
                )
            }
            .frame(width: 333)
            .padding(.bottom)
        }
    }
}

#Preview {
    OnboardingFourth2verView()
}
