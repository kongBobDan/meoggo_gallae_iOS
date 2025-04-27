//
//  OnboardingSecondView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/24/25.
//

import SwiftUI

struct OnboardingSecondView: View {
    @State private var isActive = false

    var body: some View {
        ZStack {
            Image(Asset.Onboarding.second)
                .resizable()
                .frame(width: 634.89, height: 760.8)
                .offset(x: 120, y: 125)
            VStack {
                Spacer()
                    .frame(height: 100)
                Text("반가워!")
                Text("먹고갈래에 잘 왔어.")
                Spacer()
            }
            .textStyle(TextStyle.title1.bold)
            
            NavigationLink(
                destination: OnboardingThirdView(),
                isActive: $isActive,
                label: { EmptyView() }
            )
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                isActive = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        OnboardingSecondView()
    }
}
