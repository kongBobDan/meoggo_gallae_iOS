//
//  FoodSelectView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/7/25.
//

import SwiftUI

struct FoodSelectOnboardingView: View {
    @State private var round: String = ""
    @State private var roundOptions: [String] = []
    @State private var navigateToSelecting = false
    @State private var selectedRoundInt: Int = 0
    @State private var home = false

    var body: some View {
        NavigationStack {
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
                        MGDropDown(
                            options: roundOptions,
                            selection: $round
                        )
                    }
                    .frame(height: 168)
                    .padding(.horizontal, 75)

                    NavigationLink(
                        destination: FoodSelectingView(initialRound: selectedRoundInt),
                        isActive: $navigateToSelecting
                    ) {
                        EmptyView()
                    }

                    if round.isEmpty {
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
                                if let number = Int(round.replacingOccurrences(of: "강", with: "")) {
                                    selectedRoundInt = number
                                    navigateToSelecting = true
                                }
                            }
                        )
                        .padding(.horizontal, 40)
                        .padding(.bottom, 10)
                    }
                }
            }
            .toolbar {
                MGToolbarBackButton {
                    home = true
                }
            }
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $home) {
                HomeView()
            }
            .onAppear {
                TournamentApi.shared.fetchFoodCountAndUpdateRounds { rounds in
                    self.roundOptions = rounds
                }
            }
        }
    }
}

#Preview {
    FoodSelectOnboardingView()
}
