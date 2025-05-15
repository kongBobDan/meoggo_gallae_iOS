//
//  BubbleCellType.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

enum BubbleCellType {
    case home, select, screen1, screen2
}

struct BubbleCellStyle {
    let type: BubbleCellType

    var bgcolor: Color {
        switch type {
        case .home: return .p[800]
        case .select: return .b[400]
        case .screen1: return .p[400]
        case .screen2: return .b[300]
        }
    }

    var textcolor: Color {
        switch type {
        case .home: return .b[0]
        case .select: return .s["gray"]
        case .screen1: return .b[0]
        case .screen2: return .b[600]
        }
    }
}
