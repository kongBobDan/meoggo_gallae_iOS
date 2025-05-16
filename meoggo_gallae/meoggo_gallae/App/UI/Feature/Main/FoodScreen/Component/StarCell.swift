//
//  RatingView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct StarCell: View {
    @Binding var rating: Int
    var maximumRating: Int = 5
    let spacing: CGFloat
    let frame: CGFloat
    var filledImage: Image = Image(Asset.Star.fill)
    var emptyImage: Image = Image(Asset.Star.empty)

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(1...maximumRating, id: \.self) { index in
                image(for: index)
                    .resizable()
                    .frame(width: frame, height: frame)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }

    private func image(for index: Int) -> Image {
        index <= rating ? filledImage : emptyImage
    }
}
