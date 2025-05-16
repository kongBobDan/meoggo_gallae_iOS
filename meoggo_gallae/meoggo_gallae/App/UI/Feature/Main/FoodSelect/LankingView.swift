//
//  LankingView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/16/25.
//

import SwiftUI

struct LankingView: View {
    @Environment(\.dismiss) private var dismiss
    let sampleData: [BarChartData] = [
        .init(label: "승률", value: 99, color: .p[400]),
        .init(label: "우승비율", value: 23, color: .p[400]),
    ]
    
    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()
            ScrollView {
                VStack {
                    HStack(alignment: .bottom) {
                        Text("나의")
                        EndGreenText(text: "원픽")
                        Text("급식메뉴")
                    }
                    .padding(.top, 40)
                    .textStyle(TextStyle.title1.bold)
                    Text("\"음식이름\"")
                        .textStyle(TextStyle.foodname)
                        .padding(.top, 1)
                    FoodImageCell(image: Asset.Food.dummy2, width: 333, height: 230)
                        .padding(.bottom)
                    let winRate = sampleData.first(where: { $0.label == "승률" })?.value ?? 0
                    let victoryRatio = sampleData.first(where: { $0.label == "우승비율" })?.value ?? 0
                    HStack(spacing: 5) {
                        Text("급식 메뉴들 중에서")
                            .textStyle(TextStyle.body.default)
                        Text("\(Int(winRate))%")
                            .textStyle(TextStyle.body.bold)
                            .foregroundColor(.p[500])
                        Text("정도의 승률과")
                            .textStyle(TextStyle.body.default)
                    }
                    HStack(spacing: 0) {
                        Text("\(Int(victoryRatio))%")
                            .textStyle(TextStyle.body.bold)
                            .foregroundColor(.p[500])
                        Text("의 우승비율을 가지고 있어요.")
                            .textStyle(TextStyle.body.default)
                    }
                    BarChartCell(data: sampleData, maxValue: 150)
                    Rectangle()
                        .frame(height: 5)
                        .offset(y: -38)
                        .foregroundColor(.p[400])
                    VStack(spacing: 0) {
                        HorizontalWave()
                            .fill(.white)
                            .frame(height: 65)
                            .scaleEffect(x: -1, y: 1)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("메뉴 전체 랭킹")
                                .textStyle(TextStyle.title1.bold)
                            ForEach(1...128, id: \.self) { rank in
                                LankingCell(
                                    rank: rank,
                                    foodname: "분식",
                                    image: Asset.Food.dummy1,
                                    winning: 99,
                                    rating: 23
                                )
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                    }
                    .padding(.top)
                }
                .toolbar {
                    MGToolbarBackButton {
                        dismiss()
                    }
                }
                .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    LankingView()
}
