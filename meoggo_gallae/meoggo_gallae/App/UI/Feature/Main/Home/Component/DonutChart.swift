//
//  DonutChart.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/3/25.
//

import SwiftUI
import Charts

struct WasteData: Identifiable {
    let id = UUID()
    let category: String
    let percentage: Double
    let color: Color
}

struct DonutChart: View {
    let data: [WasteData] = [
        WasteData(category: "적게 남긴 날", percentage: 23, color: .p[400]),
        WasteData(category: "적당히 먹은 날", percentage: 63, color: .b[600]),
        WasteData(category: "많이 남긴 날", percentage: 33, color: .b[400])
    ]

    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading, spacing: 15) {
                Text("3월달 잔반량 통계")
                    .textStyle(TextStyle.callout.bold)
                    .bold()
                ForEach(data) { item in
                    HStack(spacing: 8) {
                        Circle()
                            .fill(item.color)
                            .frame(width: 10, height: 10)
                        Text(item.category)
                            .textStyle(TextStyle.caption1.default)
                            .foregroundColor(.g[800])
                        Spacer()
                        Text("\(Int(item.percentage))%")
                            .textStyle(TextStyle.footnote.bold)
                            .foregroundColor(.s["gray"])
                    }
                }
            }
            .padding(.trailing)
            
            ZStack {
                Chart(data) { item in
                    SectorMark(
                        angle: .value("비율", item.percentage),
                        innerRadius: .ratio(0.65),
                        angularInset: 0
                    )
                    .foregroundStyle(item.color)
                }
                .frame(width: 130, height: 130)
                .chartLegend(.hidden)
                if let lowWaste = data.first(where: { $0.category == "적게 남긴 날" }) {
                    Text("\(Int(lowWaste.percentage))%")
                        .textStyle(TextStyle.largebodycopy.bold)
                        .foregroundColor(.p[600])
                }
            }
        }
        .padding(.horizontal, 25)
        .padding(.top, 50)
        .frame(maxWidth: .infinity)
        .frame(height: 256)
        .background(Color.b[300])
        .clipShape(RoundedCorner(radius: 30, corners: [.bottomLeft, .bottomRight]))
    }
}

#Preview {
    DonutChart()
}
