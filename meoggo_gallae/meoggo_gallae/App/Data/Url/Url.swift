//
//  Url.swift
//  meoggo_gallae
//
//  Created by 이다경 on 6/9/25.
//

import Foundation

struct MGURL {
    static let url = "http://0.0.0.0:3000"
    
    static let user = "\(url)/user"
    
    static let leftover = "\(url)/leftover"
    
    static let tournament = "\(url)/tournament"
    
    static let meal = "\(url)/meal"
    
    enum User {
        static let postLogin = "\(user)/login" // 로그인
        static func getUserLeftoverStats(id: Int) -> String {
            return "\(user)/\(id)/stats" // 사용자 잔반 통계 조회
        }
    }
    
    enum Leftover {
        static let postLeftoverCheck = "\(leftover)/check" // 잔반량 체크
        static func getAllLeftoverHistory(userId: Int) -> String {
            return "\(leftover)/history/\(userId)" // 잔반 기록 조회
        }
        static func getTodayLeftoverHistory(userId: Int) -> String {
            return "\(leftover)/today/\(userId)" // 오늘의 잔반 기록 조회
        }
    }
    
    enum Tournament {
        static let postRegistrationFood = "\(tournament)/food" // 음식 아이템 등록
        static let getAllFoodList = "\(tournament)/foods" // 모든 음식 목록 조회
        static let getTournamentRoundData = "\(tournament)/round" // ㅌ토너먼트 라운드 데이터 조회
        static let postTournamentVote = "\(tournament)/vote" // 토너먼트 투표
        static func getStatisticsByFood(id: Int) -> String {
            return "\(tournament)/food/\(id)/stats" // 음식별 통계 조회
        }
        static let getleaderboard = "\(tournament)/leaderboard" // 리더보드 조회
        static func getUserVoteHistory(userId: Int) -> String {
            return "\(tournament)/user/\(userId)/votes" // 사용자 투표 기록 조회
        }
    }
    
    enum Meal {
        static let getTodayMeal = "\(meal)/today" // 오늘의 급식 조회
    }
}
