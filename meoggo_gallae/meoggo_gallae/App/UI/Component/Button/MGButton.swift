//
//  MGButton.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/18/25.
//

import SwiftUI

enum MGButtonType {
    case enabled, focused, pressed
}

enum MGButtonSize {
    case small, medium
}

enum MGButtonColor {
    case light, fill, dark
}

// MARK: - Style Resolver

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
        switch type {
        case .filled:
            switch (enabled, color) {
            case (true, .purple): return .p[500]
            case (false, .purple): return .p[300]
            case (true, .dark): return .b[600]
            case (false, .dark): return .b[600].opacity(0.6)
            }
        case .outlined:
            return .g[0]
        case .neutral:
            switch (enabled, color) {
            case (true, .purple): return .g[100]
            case (false, .purple): return .g[100].opacity(0.6)
            case (true, .dark): return .p[50]
            case (false, .dark): return .p[50].opacity(0.6)
            }
        }
    }

    var borderColor: Color {
        guard type == .outlined else { return .clear }

        switch (enabled, color) {
        case (true, .purple): return .g[200]
        case (false, .purple): return .g[200].opacity(0.6)
        case (true, .dark): return .p[500]
        case (false, .dark): return .p[500].opacity(0.6)
        }
    }

    var borderWidth: CGFloat {
        return type == .outlined ? 1 : 0
    }
}
