//
//  ConfrontationButton.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/3/25.
//

import SwiftUI

struct ConfrontationButton: View {
    var body: some View {
        ZStack {
            Image(Asset.Home.confrontation)
                .resizable()
                .frame(width: 315, height: 236)
                .offset(x: -55, y: 40)
            VStack {
                VStack(alignment: .trailing) {
                    Text("이번 급식 메뉴 월드컵")
                        .padding(.trailing)
                    Text("하러가기 >")
                        .padding(.trailing)
                    BubbleCell(
                        text: "너 이뻐하실 듯",
                        type: .home
                    )
                }
                .padding(.leading, 75)
                .textStyle(TextStyle.body.bold)
                BubbleCell(
                    text: "이거 하면 영양사 쌤이",
                    type: .home
                )
            }
            .padding(.leading, 65)
        }
        .frame(width: 333, height: 195)
        .background(Color.b[300])
        .cornerRadius(10)
    }
}
