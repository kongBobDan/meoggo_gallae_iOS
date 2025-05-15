//
//  ResultText.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct ResultText: View {
    let type: ResultTextType
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                BubbleCell(text: style.bubble2, type: .screen2)
            }
            .padding(.bottom)
            .padding(.trailing, 30)
            Text(style.title)
                .textStyle(TextStyle.title3.bold)
                .frame(minWidth: 215)
                .frame(maxWidth: 259)
                .multilineTextAlignment(.center)
            HStack {
                BubbleCell(text: style.bubble1, type: .screen1)
                Spacer()
            }
            .padding(.leading, 50)
        }
    }
    private var style: ResultTextStyle {
        ResultTextStyle(type: type)
    }
}
