//
//  UserModel.swift
//  meoggo_gallae
//
//  Created by 이다경 on 6/12/25.
//

import SwiftUI

struct UserKey: Codable, Equatable {
    let grade: Int
    let classNumber: Int
    let studentNumber: Int
}

struct LoginRequest: Encodable {
    let grade: Int
    let classNumber: Int
    let studentNumber: Int
}

struct LoginResponse: Decodable {
    let success: Bool
    let user: UserInfo
}

struct UserInfo: Decodable {
    let id: Int
    let grade: Int
    let classNumber: Int
    let studentNumber: Int
}
