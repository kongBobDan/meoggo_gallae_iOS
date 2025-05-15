//
//  FoodSelectView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodSelectingView: View {
    @State private var showPopup = false
    @State private var navigateToOnboarding = false
    
    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()
            VStack(spacing: 15) {
                FoodSelectCell(
                    image: Asset.Food.dummy1,
                    name: "괄도네넴띤"
                )
                Image(Asset.FoodSelect.text)
                    .resizable()
                    .frame(width: 69, height: 45)
                FoodSelectCell(
                    image: Asset.Food.dummy2,
                    name: "냉면"
                )
            }
            .padding(.bottom)
            VStack {
                Spacer()
                    .frame(height: 650)
                HStack(spacing: -30) {
                    Image(Asset.FoodSelect.ing)
                        .resizable()
                        .frame(width: 163.25, height: 230)
                        .offset(x: 10, y: 70)
                    VStack {
                        BubbleCell(
                            text: "난 {음식이름}가 좋던데...",
                            type: .select
                        )
                        BubbleCell(
                            text: "넌 어떤게 좋아?",
                            type: .select
                        )
                        .padding(.leading, 120)
                    }
                    .padding(.top, 35)
                }
            }
            
            if showPopup {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                MGPopUp(
                    onYes: {
                        showPopup = false
                        navigateToOnboarding = true
                    },
                    onNo: {
                        showPopup = false
                    }
                )
            }
        }
        .toolbar {
            MGToolbarBackButton (
                action: { showPopup = true },
                foodselect: true,
                round: 27,
                now: 6
            )
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $navigateToOnboarding) {
            FoodSelectOnboardingView()
        }
    }
}

#Preview {
    FoodSelectingView()
}
