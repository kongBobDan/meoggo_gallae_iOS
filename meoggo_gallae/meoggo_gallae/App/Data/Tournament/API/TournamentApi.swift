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
    
    // 메뉴 순위 (리더보드) 조회 API
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
    
    // 특정 음식의 랭킹 통계 정보 조회 API (food id 고정: 1)
    func fetchMyFoodRanking(foodId: Int, completion: @escaping (Result<FoodRankingStat, Error>) -> Void) {
        let url = URL(string: MGURL.Tournament.getStatisticsByFood(id: foodId))!

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

    // 전체 음식 리스트 개수를 기반으로 가능한 토너먼트 라운드(강) 계산 함수 (API 호출 아님, 로컬 계산)
    func calculateAvailableRounds(from count: Int) -> [String] {
        let base = [4, 8, 16, 32, 64, 128, 132]
        return base.filter { $0 <= count }.reversed().map { "\($0)강" }
    }
    
    // 모든 음식 목록 조회
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
    
//    // 특정 라운드, 제한 개수에 해당하는 음식 리스트 조회 API (GET + JSON body - 다소 비표준)
//    func fetchRoundFoods(round: Int, limit: Int, completion: @escaping (Result<[SelectFoodItem], Error>) -> Void) {
//        let url = URL(string: MGURL.Tournament.getTournamentRoundData)!
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let body: [String: Any] = ["round": round, "limit": limit]
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(ApiError.emptyResponse))
//                return
//            }
//
//            do {
//                let decoded = try JSONDecoder().decode(RoundFoodResponse.self, from: data)
//                completion(.success(decoded.foods))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }

    // 토너먼트 라운드 데이터 조회
    func fetchRoundFoods(round: Int, limit: Int = 2, completion: @escaping (Result<RoundFoodResponse, Error>) -> Void) {
        print("[fetchRoundFoods] ⏳ 요청 준비중...")

        // URL 구성 (쿼리 파라미터 포함)
        var components = URLComponents(string: MGURL.Tournament.getTournamentRoundData)!
        components.queryItems = [
            URLQueryItem(name: "round", value: String(round)),
            URLQueryItem(name: "limit", value: String(limit))
        ]

        guard let url = components.url else {
            print("[fetchRoundFoods] ❌ URL 생성 실패")
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        print("[fetchRoundFoods] 📤 요청 URL:", url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("[fetchRoundFoods] ❌ Request error:", error)
                completion(.failure(error))
                return
            }

            guard let data = data else {
                print("[fetchRoundFoods] ❌ No data")
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }

            // 디버깅용 응답 출력
            if let jsonString = String(data: data, encoding: .utf8) {
                print("[fetchRoundFoods] 📄 응답 데이터:\n\(jsonString)")
            }

            do {
                let decoded = try JSONDecoder().decode(RoundFoodResponse.self, from: data)
                print("[fetchRoundFoods] ✅ 성공적으로 파싱됨")
                completion(.success(decoded))
            } catch {
                print("[fetchRoundFoods] ❌ 디코딩 실패:", error)
                completion(.failure(error))
            }
        }.resume()
    }

    
    // 토너먼트 투표
    func voteFood(userId: Int, winnerId: Int, loserId: Int, round: Int, completion: ((Error?) -> Void)? = nil) {
            guard let url = URL(string: MGURL.Tournament.postTournamentVote) else {
                completion?(ApiError.invalidURL)
                return
            }
            
            let voteData: [String: Any] = [
                "userId": userId,
                "winnerId": winnerId,
                "loserId": loserId,
                "round": round
            ]
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = try? JSONSerialization.data(withJSONObject: voteData)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { _, _, error in
                DispatchQueue.main.async {
                    completion?(error)
                }
            }.resume()
        }
}

enum ApiError: Error {
    case invalidURL
    case emptyResponse
}
