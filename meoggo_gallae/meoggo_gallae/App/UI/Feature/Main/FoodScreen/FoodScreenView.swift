//
//  FoodScreenView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodScreenView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()
            VStack(spacing: 30) {
                Image(Asset.Food.dummy1)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 258)
                Text("급식 먹은 날짜를 작성해주세요!")
                    .textStyle(TextStyle.largebodycopy.bold)
                HStack {
//                    NumberPicker(range: 25...27, title: "년")
                    Spacer()
//                    NumberPicker(range: 1...12, title: "월")
                    Spacer()
//                    NumberPicker(range: 1...31, title: "일")
                }
                .frame(width: 290)
                Spacer ()
                    .frame(height: 100)
                MGButton (
                    title: "작성 완료",
                    type: .enabled,
                    size: .medium,
                    color: .dark,
                    action: {}
                )
                .frame(width: 333)
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
    FoodScreenView()
}
