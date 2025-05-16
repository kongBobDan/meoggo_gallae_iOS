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
        let image: String
        let winning: Double
        let rating: Double

        var sampleData: [BarChartData] {
            [
                .init(label: "승률", value: winning, color: .b[500]),
                .init(label: "우승비율", value: rating, color: .b[500]),
            ]
        }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(String(rank)+"위 - "+foodname)
                    .textStyle(TextStyle.title3.bold)
                FoodImageCell(image: image, width: 208, height: 136)
            }
            BarChartCell(data: sampleData, maxValue: 150)
        }
    }
}
