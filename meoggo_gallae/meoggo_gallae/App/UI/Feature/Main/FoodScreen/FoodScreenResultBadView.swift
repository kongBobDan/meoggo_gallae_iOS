//
//  FoodScreenResultBadView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodScreenResultBadView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isRatingPresented = false
    
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
            }
            .toolbar {
                MGToolbarBackButton {
                    dismiss()
                }
            }
            .navigationBarBackButtonHidden()
            .sheet(isPresented: $isRatingPresented) {
                RatingView()
                    .presentationDetents([.height(245)])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    FoodScreenResultBadView()
}
