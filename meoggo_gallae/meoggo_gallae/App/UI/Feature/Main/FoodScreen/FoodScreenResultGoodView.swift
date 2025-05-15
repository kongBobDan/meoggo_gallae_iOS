//
//  FoodScreenResultGoodView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodScreenResultGoodView: View {
    @Environment(\.dismiss) private var dismiss
    
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
    FoodScreenResultGoodView()
}
