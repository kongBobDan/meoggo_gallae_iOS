//
//  LankingCell.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/16/25.
//

import SwiftUI

struct LankingCell: View {
    let rank: Int
    let foodname: String
    let imagePath: String
    let winning: Double
    let rating: Int

    var body: some View {
        HStack(spacing: 16) {
            Text("\(rank)")
                .textStyle(TextStyle.body.bold)
                .frame(width: 30)

            AsyncImage(url: URL(string: imagePath)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 40, height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading) {
                Text(foodname)
                    .textStyle(TextStyle.body.bold)
                HStack {
                    Text("승률 \(Int(round(winning)))%")
                        .textStyle(TextStyle.caption1.default)
                    Text("우승 \(rating)회")
                        .textStyle(TextStyle.caption1.default)
                        .foregroundColor(.g[700])
                }
            }

            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}
