//
//  RatingView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/16/25.
//

import SwiftUI

struct RatingView: View {
    @State private var starnum: Int = 0
    
    var body: some View {
        ZStack {
            Color.b[200]
            VStack(spacing: 5) {
                Text("별점을 남겨주세요!")
                    .textStyle(TextStyle.title1.bold)
                Text("오늘의 급식 맛은 어느정도였나요?")
                    .textStyle(TextStyle.body.default)
                StarCell(rating: $starnum, spacing: 10, frame: 34)
                    .padding(.top, 25)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
