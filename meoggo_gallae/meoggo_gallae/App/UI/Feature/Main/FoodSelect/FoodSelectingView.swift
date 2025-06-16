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
    @State private var foods: [SelectFoodItem] = []
    @State private var isLoading = true

    private let round = 16
    private let limit = 2

    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()

            if isLoading {
                ProgressView("음식을 불러오는 중...")
            } else {
                VStack(spacing: 15) {
                    ForEach(foods) { food in
                        FoodSelectCell(
                            imagePath: food.imagePath,
                            name: food.name
                        )
                    }

                    Image(Asset.FoodSelect.text)
                        .resizable()
                        .frame(width: 69, height: 45)
                }
                .padding(.bottom)

                VStack {
                    Spacer().frame(height: 650)

                    HStack(spacing: -30) {
                        Image(Asset.FoodSelect.ing)
                            .resizable()
                            .frame(width: 163.25, height: 230)
                            .offset(x: 10, y: 70)

                        VStack {
                            BubbleCell(
                                text: "난 \(foods.first?.name ?? "이 음식")가 좋던데...",
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
            }

            if showPopup {
                Color.black.opacity(0.4).ignoresSafeArea()
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
        .onAppear(perform: fetchFoods)
        .toolbar {
            MGToolbarBackButton(
                action: { showPopup = true },
                foodselect: true,
                round: round,
                now: 6
            )
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $navigateToOnboarding) {
            FoodSelectOnboardingView()
        }
    }

    private func fetchFoods() {
        isLoading = true
        TournamentApi.shared.fetchRoundFoods(round: round, limit: limit) { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let fetchedFoods):
                    foods = fetchedFoods
                case .failure(let error):
                    print("Fetch error: \(error)")
                }
            }
        }
    }
}
