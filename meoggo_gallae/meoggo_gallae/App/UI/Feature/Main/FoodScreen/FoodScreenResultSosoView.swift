//
//  FoodScreenResultSosoView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodScreenResultSosoView: View {
    @State private var isRatingPresented = false
    @State private var goToHome = false
    
    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()
            VStack(spacing: 107) {
                Image(Asset.Result.Soso.text)
                    .resizable()
                    .frame(width: 230, height: 190)
                ResultText(type: .good)
            }
            HStack {
                Image(Asset.Result.Soso.MG)
                    .resizable()
                    .frame(width: 304.54, height: 305.17)
                    .offset(x: -90)
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
    FoodScreenResultSosoView()
}
