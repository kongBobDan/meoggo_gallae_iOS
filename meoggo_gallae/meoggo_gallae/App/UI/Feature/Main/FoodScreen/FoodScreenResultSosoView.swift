//
//  FoodScreenResultSosoView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodScreenResultSosoView: View {
    @Environment(\.dismiss) private var dismiss
    
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
    FoodScreenResultSosoView()
}
