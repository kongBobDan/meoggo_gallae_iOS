//
//  FoodScreenResultGoodView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodScreenResultGoodView: View {
    @State private var isRatingPresented = false
    @State private var goToHome = false
    
    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()
            VStack(spacing: 31) {
                Image(Asset.Result.Good.text)
                    .resizable()
                    .frame(width: 250, height: 223)
                ResultText(type: .good)
            }
            VStack {
                Image(Asset.Result.Good.MG)
                    .resizable()
                    .frame(width: 279.92, height: 252)
                    .offset(x: 70, y: -100)
                Spacer()
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
    }
}

#Preview {
    FoodScreenResultGoodView()
}
