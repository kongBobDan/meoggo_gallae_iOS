//
//  ChartCell.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/16/25.
//

import SwiftUI

struct BarChartData: Identifiable {
    let id = UUID()
    let label: String
    let value: Double
    let color: Color
}

struct BarChartCell: View {
    let data: [BarChartData]
    let maxValue: Double

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom, spacing: 12) {
                ForEach(data) { item in
                    VStack {
                        Spacer()
                        HStack(spacing: 0) {
                            Text("\(Int(item.value))")
                                .textStyle(TextStyle.largebodycopy.bold)
                            Text("%")
                                .textStyle(TextStyle.body.bold)
                        }
                        .foregroundColor(.g[900])
                        Rectangle()
                            .fill(item.color)
                            .frame(width: 42, height: CGFloat(item.value / maxValue) * 200)
                            .cornerRadius(20, corners: [.topLeft, .topRight])
                        Text(item.label)
                            .textStyle(TextStyle.callout.default)
                            .foregroundColor(.g[800])
                    }
                }
            }
            .frame(height: 220)
            .padding(.horizontal)
        }
    }
}
