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

    func calculateAvailableRounds(from count: Int) -> [String] {
        let base = [4, 8, 16, 32, 64, 128, 132]
        return base.filter { $0 <= count }.reversed().map { "\($0)강" }
    }
    
    func fetchFoodCountAndUpdateRounds(completion: @escaping ([String]) -> Void) {
        let url = URL(string: MGURL.Tournament.getAllFoodList)!

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(FoodListResponse.self, from: data)
                    let rounds = calculateAvailableRounds(from: decoded.foods.count)
                    DispatchQueue.main.async {
                        completion(rounds)
                    }
                } catch {
                    print("JSON decode error: \(error)")
                }
            } else if let error = error {
                print("Request error: \(error)")
            }
        }.resume()
    }
    
    func fetchRoundFoods(round: Int, limit: Int, completion: @escaping (Result<[SelectFoodItem], Error>) -> Void) {
        let url = URL(string: MGURL.Tournament.getTournamentRoundData)!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = ["round": round, "limit": limit]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

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
                let decoded = try JSONDecoder().decode(RoundFoodResponse.self, from: data)
                completion(.success(decoded.foods))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchFoods(round: Int, limit: Int = 2, completion: @escaping (Result<RoundFoodResponse, Error>) -> Void) {
            guard let url = URL(string: MGURL.Tournament.postTournamentVote) else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0)))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            let body: [String: Any] = [
                "round": round,
                "limit": limit
            ]

            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    completion(.failure(NSError(domain: "No data", code: 0)))
                    return
                }

                do {
                    let decoded = try JSONDecoder().decode(RoundFoodResponse.self, from: data)
                    completion(.success(decoded))
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
