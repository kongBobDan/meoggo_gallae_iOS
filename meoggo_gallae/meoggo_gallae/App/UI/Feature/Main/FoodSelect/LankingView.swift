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
    
    @State private var leaderboardData: [LeaderboardItem] = []
    @State private var myFoodStat: FoodRankingStat?

    
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
                    if let stat = myFoodStat {
                        Text("\"\(stat.name)\"")
                            .textStyle(TextStyle.foodname)
                            .padding(.top, 1)
                        
                        AsyncImage(url: URL(string: "http://0.0.0.0:3000/" + stat.imagePath)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 333, height: 230)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                        let winRate = stat.winRate
                        let victoryRatio = stat.championshipRate

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

                        let sampleData = [
                            BarChartData(label: "승률", value: winRate, color: .p[400]),
                            BarChartData(label: "우승비율", value: victoryRatio, color: .p[400])
                        ]
                        BarChartCell(data: sampleData, maxValue: 100)
                            .padding(.top, 20)
                    }
                    Rectangle()
                        .frame(height: 5)
                        .offset(y: -10)
                        .foregroundColor(.p[400])
                    VStack(spacing: 0) {
                        HorizontalWave()
                            .fill(.white)
                            .frame(height: 65)
                            .scaleEffect(x: -1, y: 1)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("메뉴 전체 랭킹")
                                .textStyle(TextStyle.title1.bold)
                                .padding(.bottom, 10)
                            ForEach(Array(leaderboardData.enumerated()), id: \.element.id) { (index, item) in
                                LankingCell(
                                    rank: index + 1,
                                    foodname: item.name,
                                    imagePath: item.imagePath,
                                    winning: item.winRate,
                                    rating: item.wins
                                )
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 40)
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
                .onAppear {
                    TournamentApi.shared.fetchLeaderboard { result in
                        switch result {
                        case .success(let data):
                            self.leaderboardData = data
                        case .failure(let error):
                            print("Failed to fetch leaderboard:", error)
                        }
                    }
                }
                .onAppear {
                    TournamentApi.shared.fetchMyFoodRanking { result in
                        switch result {
                        case .success(let stat):
                            DispatchQueue.main.async {
                                self.myFoodStat = stat
                            }
                        case .failure(let error):
                            print("Failed to fetch my food stat:", error)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LankingView()
}
