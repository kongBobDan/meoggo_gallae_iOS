//
//  MealApi.swift
//  meoggo_gallae
//
//  Created by 이다경 on 6/13/25.
//

import SwiftUI
import Alamofire
import Combine

struct MealApi {
    static func fetchTodayMeal(completion: @escaping (Result<Meal, Error>) -> Void) {
        let url = URL(string: MGURL.Meal.getTodayMeal)!
        
        AF.request(url)
            .validate()
            .responseDecodable(of: TodayMealResponse.self) { response in
                switch response.result {
                case .success(let mealResponse):
                    completion(.success(mealResponse.meal))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
