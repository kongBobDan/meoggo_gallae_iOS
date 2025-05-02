//
//  ConfrontationButton.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/2/25.
//

import SwiftUI

struct ConfrontationButton: View {
    var body: some View {
        ZStack {
            Image(Asset.Home.confrontation)
                .resizable()
                .frame(width: 315, height: 236)
                .offset(x: -50, y: 35)
            VStack {
                VStack(alignment: .trailing) {
                    Text("이번 급식 메뉴 월드컵")
                    Text("하러가기 >")
                    BubbleCell(content: "너 이뻐하실 듯", imageName: Asset.Home.heart)
                }
                .textStyle(TextStyle.body.bold)
                .padding(.leading, 100)
                BubbleCell(content: "이거 하면 영양사 쌤이", imageName: nil)
                
            }
            .padding(.leading, 50)
        }
        .frame(width: 333, height: 195)
        .background(Color.b[300])
        .cornerRadius(10)
    }
}

#Preview {
    ConfrontationButton()
}
