//
//  TournamentModel.swift
//  meoggo_gallae
//
//  Created by 이다경 on 6/15/25.
//

import SwiftUI

struct LeaderboardResponse: Codable {
    let success: Bool
    let leaderboard: [LeaderboardItem]
}

struct LeaderboardItem: Codable, Identifiable {
    let id: Int
    let name: String
    let imagePath: String
    let totalVotes: Int
    let wins: Int
    let matches: Int
    let winRate: Int
}

struct FoodRankingStatResponse: Decodable {
    let success: Bool
    let stats: FoodRankingStat
}

struct FoodRankingStat: Identifiable, Decodable {
    let id: Int
    let name: String
    let imagePath: String
    let totalVotes: Int
    let wins: Int
    let matches: Int
    let winRate: Double
    let rank: Int
    let championshipRate: Double
}

struct FoodListResponse: Decodable {
    let success: Bool
    let foods: [FoodItem]
}

struct FoodItem: Decodable {
    let id: Int
    let name: String
    let imagePath: String
    let totalVotes: Int
    let wins: Int
    let matches: Int
}

struct SelectFoodItem: Codable, Identifiable {
    let id: Int
    let name: String
    let imagePath: String
}

struct RoundFoodResponse: Codable {
    let success: Bool
    let round: Int
    let foods: [SelectFoodItem]
}
