//
//  LeftoverModel.swift
//  meoggo_gallae
//
//  Created by 이다경 on 6/23/25.
//

import SwiftUI

struct LeftoverResponse: Decodable {
    let success: Bool
    let record: LeftoverRecord
}

struct LeftoverRecord: Decodable {
    let id: Int
    let recordDate: String
    let leftoverLevel: String
    let aiConfidence: Double
    let imagePath: String
}
