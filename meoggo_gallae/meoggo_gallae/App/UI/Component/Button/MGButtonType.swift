//
//  MGButton.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/18/25.
//

import SwiftUI

enum MGButtonType {
    case enabled, focused
}

enum MGButtonSize {
    case small, medium
}

enum MGButtonColor {
    case light, fill, dark
}

struct MGButtonStyle {
    let type: MGButtonType
    let size: MGButtonSize
    let color: MGButtonColor

    var height: CGFloat {
        switch size {
        case .medium: return 54
        case .small: return 44
        }
    }

    var textStyle: TextStyle {
        switch size {
        case .medium: return TextStyle.button.text
        case .small: return TextStyle.button.smalltext
        }
    }

    var textColor: Color {
        if color == .light {
            return .s["gray"]
        } else {
            return .b[0]
        }
    }

    var backgroundColor: Color {
        switch color {
        case .fill:
            switch type {
            case .enabled: return .p[600]
            case .focused: return .p[500]
            }
        case .light:
            switch type {
            case .enabled: return .b[300]
            case .focused: return .b[200]
            }
        case .dark:
            switch type {
            case .enabled: return .s["brown"]
            case .focused: return .s["brown"].opacity(0.6)
            }
        }
    }
}
