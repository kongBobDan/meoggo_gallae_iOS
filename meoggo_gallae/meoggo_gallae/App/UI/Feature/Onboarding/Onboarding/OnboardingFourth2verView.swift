//
//  OnboardingFourth2verView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/24/25.
//

import SwiftUI

struct OnboardingFourth2verView: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            Image(Asset.Onboarding.fourth.ver2)
                .resizable()
                .frame(width: 530.68, height: 691)
                .offset(y: 170)
            VStack {
                Spacer()
                    .frame(height: 100)
                Text("그래!")
                Text("우리 같이 먹고갈래로 놀자!")
                Spacer()
            }
            .textStyle(TextStyle.title1.bold)
            
            NavigationLink(
                destination: HomeView(),
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
    OnboardingFourth2verView()
}
