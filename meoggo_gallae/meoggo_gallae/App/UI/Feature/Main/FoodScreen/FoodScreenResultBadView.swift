//
//  FoodScreenResultBadView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodScreenResultBadView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()
            VStack(spacing: 45) {
                Image(Asset.Result.bad)
                    .resizable()
                    .frame(width: 355.45, height: 306)
                ResultText(type: .bad)
            }
            .toolbar {
                MGToolbarBackButton {
                    dismiss()
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    FoodScreenResultBadView()
}
