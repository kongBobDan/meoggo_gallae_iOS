//
//  SmallRatingView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/16/25.
//

import SwiftUI

struct SmallRatingView: View {
    @State private var starnum: Int = 0
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 35) {
                HStack {
                    Text("별점 남기기")
                        .textStyle(TextStyle.body.bold)
                    Spacer()
                    StarCell(rating: $starnum, spacing: 2, frame: 24)
                        .allowsHitTesting(false)
                }
                .frame(width: 335)
                Rectangle()
                    .frame(width: 23, height: 1)
            }
            .frame(maxWidth: .infinity)
            .background(Color.b[200])
            .foregroundColor(.s["gray"])
        }
    }
}
