//
//  MealModel.swift
//  meoggo_gallae
//
//  Created by 이다경 on 6/13/25.
//

import SwiftUI
import Foundation

struct TodayMealResponse: Decodable {
    let success: Bool
    let meal: Meal
}

struct Meal: Decodable {
    let date: String
    let breakfast: [String]
    let lunch: [String]
    let dinner: [String]
}
