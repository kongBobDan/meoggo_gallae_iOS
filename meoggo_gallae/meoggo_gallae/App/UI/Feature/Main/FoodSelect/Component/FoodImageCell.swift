//
//  FoodImageCell.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

import SwiftUI

struct FoodImageCell: View {
    let image: String
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black

                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width)
                    .frame(height: max(geometry.size.height, height))
                    .clipped()
                    .frame(width: width, height: height)
            }
        }
        .frame(width: width, height: height)
    }
}

