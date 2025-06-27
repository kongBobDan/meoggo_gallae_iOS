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
    @State private var matchIndex = 0
    @State private var foods: [SelectFoodItem] = []
    @State private var allRounds: [Int: [SelectFoodItem]] = [:]
    @State private var isLoading = true
    @State private var showPopup = false
    @State private var navigateToOnboarding = false
    @State private var navigateToResult = false
    @State private var winnerFood: SelectFoodItem? = nil

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
            } else if foods.count == 2 {
                    VStack(spacing: 15) {
                        Button {
                            onFoodSelected(winner: foods[0], loser: foods[1])
                        } label: {
                            FoodSelectCell(
                                image: MGURL.url + "/" + foods[0].imagePath,
                                name: foods[0].name
                            )
                        }
                        
                        Image(Asset.FoodSelect.text)
                            .resizable()
                            .frame(width: 69, height: 45)
                        
                        Button {
                            onFoodSelected(winner: foods[1], loser: foods[0])
                        } label: {
                            FoodSelectCell(
                                image: MGURL.url + "/" + foods[1].imagePath,
                                name: foods[1].name
                            )
                        }
                    }
                    .padding(.bottom, 100)
                
                    VStack {
                        Spacer().frame(height: 600)
                        HStack(spacing: -30) {
                            Image(Asset.FoodSelect.ing)
                                .resizable()
                                .frame(width: 163.25, height: 230)
                                .offset(x: 10, y: 70)
                            VStack {
                                BubbleCell(
                                    text: "난 \(foods.randomElement()?.name ?? "{음식}")(이)가 좋던데...",
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
            MGToolbarBackButton(
                action: { showPopup = true },
                foodselect: true,
                round: currentRound,
                now: matchIndex + 1,
                allRound: currentRound / 2
            )
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $navigateToOnboarding) {
            FoodSelectOnboardingView()
        }
        .navigationDestination(isPresented: $navigateToResult) {
            LankingView(winnerFood: winnerFood)
        }
        .onAppear {
            initializeTournament()
        }
    }

    private func initializeTournament() {
        isLoading = true
        TournamentApi.shared.fetchRoundFoods(round: initialRound, limit: initialRound) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    let shuffled = response.foods.shuffled()
                    allRounds[initialRound] = shuffled
                    currentRound = initialRound
                    matchIndex = 0
                    loadCurrentMatch()
                case .failure(let error):
                    print("❌ 초기 라운드 불러오기 실패: \(error)")
                }
                isLoading = false
            }
        }
    }

    private func loadCurrentMatch() {
        guard let currentFoods = allRounds[currentRound], currentFoods.count >= (matchIndex + 1) * 2 else {
            advanceToNextRound()
            return
        }
        let start = matchIndex * 2
        foods = Array(currentFoods[start..<start + 2])
    }

    private func onFoodSelected(winner: SelectFoodItem, loser: SelectFoodItem) {
        TournamentApi.shared.voteFood(userId: userId, winnerId: winner.id, loserId: loser.id, round: currentRound) { error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ 투표 실패: \(error)")
                } else {
                    let nextRound = currentRound / 2
                    allRounds[nextRound, default: []].append(winner)
                    matchIndex += 1
                    loadCurrentMatch()
                }
            }
        }
    }

    private func advanceToNextRound() {
        let nextRound = currentRound / 2
        if nextRound >= 1, let nextFoods = allRounds[nextRound] {
            if nextRound == 1 && nextFoods.count == 1 {
                winnerFood = nextFoods.first
                navigateToResult = true
            } else {
                currentRound = nextRound
                matchIndex = 0
                loadCurrentMatch()
            }
        } else {
            winnerFood = foods.first
            navigateToResult = true
        }
    }
}
