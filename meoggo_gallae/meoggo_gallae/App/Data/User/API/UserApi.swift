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
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
}

