//
//  FoodSelectView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

import SwiftUI

struct FoodSelectingView: View {
    @State private var currentRound = 16
    @State private var foods: [SelectFoodItem] = []
    @State private var isLoading = true
    @State private var showPopup = false
    @State private var navigateToOnboarding = false

    private let userId = 1

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
        TournamentApi.shared.fetchFoods(round: currentRound) { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let response):
                    self.currentRound = response.round
                    self.foods = response.foods
                case .failure(let error):
                    print("Fetch 실패: \(error.localizedDescription)")
                }
            }
        }
    }

    private func onFoodSelected(winner: SelectFoodItem, loser: SelectFoodItem) {
        guard let url = URL(string: "http://0.0.0.0:3000/tournament/vote") else { return }

        let voteData = [
            "userId": userId,
            "winnerId": winner.id,
            "loserId": loser.id,
            "round": currentRound
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: voteData)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { _, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("투표 실패: \(error)")
                } else {
                    loadFoods()
                }
            }
        }.resume()
    }

    private func otherFood(of selected: SelectFoodItem) -> SelectFoodItem {
        return foods.first(where: { $0.id != selected.id }) ?? selected
    }
}
