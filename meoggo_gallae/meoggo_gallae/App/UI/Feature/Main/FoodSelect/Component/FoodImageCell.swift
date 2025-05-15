//
//  FoodImageCell.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

import SwiftUI

struct FoodImageCell: View {
    var image: String

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black

                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 333)
                    .frame(height: max(geometry.size.height, 220))
                    .clipped()
                    .frame(width: 333, height: 220)
            }
        }
        .frame(width: 333, height: 220)
    }
}

