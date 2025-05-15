//
//  FoodSelectView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/7/25.
//

import SwiftUI

struct FoodSelectOnboardingView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var round: String = ""
    
    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()
            VStack {
                Text("최고의 급식 메뉴를")
                Text("뽑아주세요!")
                Image(Asset.FoodSelect.onboarding)
                    .resizable()
                    .frame(width: 422 , height: 375)
                Spacer()
                    .frame(height: 100)
            }
            .textStyle(TextStyle.title1.bold)
            VStack(spacing: 30) {
                Spacer()
                ScrollView {
                    MGDropDown (
                        options: [ "132강", "128강", "64강", "32강", "16강", "8강", "4강"],
                        selection: $round
                    )
                }
                .frame(height: 168)
                .padding(.horizontal, 75)
                if round == "" {
                    VStack {
                    Text("시작하기")
                        .textStyle(TextStyle.button.text)
                        .foregroundColor(.b[0])
                }
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(Color.s["brown"].opacity(0.6))
                .cornerRadius(6)
                .padding(.horizontal, 40)
                .padding(.bottom, 10)
                } else {
                    MGButton (
                        title: "시작하기",
                        type: .enabled,
                        size: .medium,
                        color: .dark,
                        action: {
                            
                        }
                    )
                    .padding(.horizontal, 40)
                    .padding(.bottom, 10)
                }
            }
        }
        .toolbar {
            MGToolbarBackButton {
                dismiss()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    FoodSelectOnboardingView()
}
