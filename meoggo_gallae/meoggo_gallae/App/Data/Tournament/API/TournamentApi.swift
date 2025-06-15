//
//  TournamentAPI.swift
//  meoggo_gallae
//
//  Created by 이다경 on 6/15/25.
//

import SwiftUI

struct TournamentApi {
    static let shared = TournamentApi()
    private init() {}
    
    func fetchLeaderboard(completion: @escaping (Result<[LeaderboardItem], Error>) -> Void) {
        let url = URL(string: MGURL.Tournament.getleaderboard)!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(URLError(.badServerResponse)))
                    return
                }
                
                do {
                    let decoded = try JSONDecoder().decode(LeaderboardResponse.self, from: data)
                    completion(.success(decoded.leaderboard))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func fetchMyFoodRanking(completion: @escaping (Result<FoodRankingStat, Error>) -> Void) {
        let url = URL(string: MGURL.Tournament.getStatisticsByFood(id: 1))!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(ApiError.emptyResponse))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(FoodRankingStatResponse.self, from: data)
                completion(.success(decoded.stats))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

}

enum ApiError: Error {
    case invalidURL
    case emptyResponse
}
