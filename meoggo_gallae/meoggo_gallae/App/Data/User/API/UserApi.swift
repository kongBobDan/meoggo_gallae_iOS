//
//  AuthApi.swift
//  meoggo_gallae
//
//  Created by 이다경 on 6/12/25.
//

import SwiftUI
import Alamofire
import Combine

struct UserApi {
    func login(body: LoginRequest) -> AnyPublisher<DataResponse<LoginResponse, AFError>, Never> {
        let url = URL(string: MGURL.User.postLogin)!
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        return AF.request(
            url,
            method: .post,
            parameters: body,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
        .validate()
        .publishDecodable(type: LoginResponse.self)
        .handleEvents(receiveOutput: { response in
            if let user = response.value?.user {
                UserSession.shared.userId = user.id
            }
        })
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func fetchWasteStats(userId: Int, completion: @escaping (Result<WasteStats, Error>) -> Void) {
        let url = URL(string: MGURL.User.getUserLeftoverStats(id: userId))!

        AF.request(url)
            .validate()
            .responseDecodable(of: WasteStatsResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.stats))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

final class UserSession {
    static let shared = UserSession()
    
    private init() {}
    
    var userId: Int?
}

func saveUserId(_ id: Int) {
    UserDefaults.standard.set(id, forKey: "userId")
}

func loadUserId() -> Int? {
    UserDefaults.standard.integer(forKey: "userId").nonZeroOrNil
}

extension Int {
    var nonZeroOrNil: Int? { self == 0 ? nil : self }
}
