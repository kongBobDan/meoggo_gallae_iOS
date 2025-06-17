//
//  FoodSelectView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodSelectingView: View {
    let initialRound: Int
    @State private var currentRound: Int
    @State private var foods: [SelectFoodItem] = []
    @State private var isLoading = true
    @State private var showPopup = false
    @State private var navigateToOnboarding = false

    private let userId = 1

    init(initialRound: Int) {
        self.initialRound = initialRound
        _currentRound = State(initialValue: initialRound)
    }

    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()

            if isLoading {
                ProgressView("로딩 중...")
            } else {
                VStack(spacing: 15) {
                    ForEach(foods, id: \.id) { food in
                        Button {
                            onFoodSelected(winner: food, loser: otherFood(of: food))
                        } label: {
                            FoodSelectCell(
                                image: food.imagePath,
                                name: food.name
                            )
                        }
                    }
                }

                VStack {
                    Spacer().frame(height: 650)
                    HStack(spacing: -30) {
                        Image(Asset.FoodSelect.ing)
                            .resizable()
                            .frame(width: 163.25, height: 230)
                            .offset(x: 10, y: 70)
                        VStack {
                            BubbleCell(
                                text: "난 \(foods.first?.name ?? "{음식}")가 좋던데...",
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
        .toolbar {
            MGToolbarBackButton (
                action: { showPopup = true },
                foodselect: true,
                round: currentRound,
                now: 6
            )
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $navigateToOnboarding) {
            FoodSelectOnboardingView()
        }
        .onAppear {
            loadFoods()
        }
    }

    private func loadFoods() {
        isLoading = true
        TournamentApi.shared.fetchRoundFoods(round: currentRound, limit: 2) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.foods = response.foods
                    self.currentRound = response.round  // 만약 라운드 업데이트도 필요하면 이렇게
                    self.isLoading = false
                case .failure(let error):
                    print("Fetch 실패: \(error.localizedDescription)")
                    self.isLoading = false
                }
            }
        }
    }
    
    private func onFoodSelected(winner: SelectFoodItem, loser: SelectFoodItem) {
        TournamentApi.shared.voteFood(userId: userId, winnerId: winner.id, loserId: loser.id, round: currentRound) { error in
            if let error = error {
                print("투표 실패: \(error)")
            } else {
                loadFoods()
            }
        }
    }

    private func otherFood(of selected: SelectFoodItem) -> SelectFoodItem {
        return foods.first(where: { $0.id != selected.id }) ?? selected
    }
}
