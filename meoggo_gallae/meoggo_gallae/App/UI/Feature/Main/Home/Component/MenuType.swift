//
//  MenuType.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/3/25.
//

import SwiftUI

enum MenuType {
    case morning, lunch, dinner
}

struct MenuStyle {
    let type: MenuType

    var iconStyle: String {
        switch type {
        case .morning: return Asset.Home.morning
        case .lunch: return Asset.Home.lunch
        case .dinner: return Asset.Home.dinner
        }
    }

    var titleType: String {
        switch type {
        case .morning: return "아침"
        case .lunch: return "점심"
        case .dinner: return "저녁"
        }
    }
}
