//
//  FoodScreenResultBadView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodScreenResultBadView: View {
    let selectedImage: UIImage  // ✅ 전달받는 이미지

    @State private var isRatingPresented = false
    @State private var goToHome = false

    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()
            VStack(spacing: 45) {
                Image(Asset.Result.bad)
                    .resizable()
                    .frame(width: 355.45, height: 306)
                ResultText(type: .bad)
            }

            VStack(spacing: 35) {
                Spacer()
                Rectangle()
                    .foregroundColor(.g[300])
                    .frame(maxWidth: .infinity)
                    .frame(height: 10)
                SmallRatingView(action: {
                    isRatingPresented = true
                })
                .frame(height: 50)

                NavigationLink(destination: HomeView(), isActive: $goToHome) {
                    EmptyView()
                }
            }
        }
        .onAppear {
            postLeftover()
        }
        .toolbar {
            MGToolbarBackButton {
                goToHome = true
            }
        }
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $isRatingPresented) {
            RatingView(onRated: { _ in
                isRatingPresented = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    goToHome = true
                }
            })
            .presentationDetents([.height(245)])
            .presentationDragIndicator(.visible)
        }
    }

    private func postLeftover() {
        LeftoverAPI.postLeftoverRecord(image: selectedImage) { result in
            switch result {
            case .success(let response):
                print("잔반 기록 성공:", response.record)
            case .failure(let error):
                print("잔반 기록 실패:", error.localizedDescription)
            }
        }
    }
}
