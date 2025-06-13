//
//  HomeView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/27/25.
//

import SwiftUI

struct HomeView: View {
    @State private var goToSelect = false
    @State private var goToScreen = false
    @State private var meal: Meal? = nil
    
    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()
            ScrollView {
                VStack(spacing: 45) {
                    DonutChart()
                        .padding(.top, -(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0))
                        .edgesIgnoringSafeArea(.top)

                    VStack(spacing: 10) {
                        ConfrontationButton(action: { goToSelect = true })
                        CameraButton(action: { goToScreen = true })
                    }

                    if let meal = meal {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(Asset.Home.calendar)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text("오늘 급식")
                                    .textStyle(TextStyle.title2.bold)
                            }

                            Menu(type: .morning, content: meal.breakfast.joined(separator: ", "))
                            Menu(type: .lunch, content: meal.lunch.joined(separator: ", "))
                            Menu(type: .dinner, content: meal.dinner.joined(separator: ", "))
                        }
                    }
                }
            }

            NavigationLink(destination: FoodSelectOnboardingView(), isActive: $goToSelect) {
                EmptyView()
            }
            NavigationLink(destination: FoodScreenView(), isActive: $goToScreen) {
                EmptyView()
            }
        }
        .onAppear {
            MealApi.fetchTodayMeal { result in
                switch result {
                case .success(let fetchedMeal):
                    meal = fetchedMeal
                case .failure(let error):
                    print("급식 불러오기 실패: \(error.localizedDescription)")
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView()
}
