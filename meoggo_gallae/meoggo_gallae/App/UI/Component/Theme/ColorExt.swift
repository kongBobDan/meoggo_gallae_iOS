//
//  ColorExt.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/18/25.
//

import SwiftUICore
import SwiftUI

extension Color {
    struct Palette_p {
        private let shades: [Int: Color] = [
            100: Color(hex: "#CCE8D9"),
            200: Color(hex: "#99D2B3"),
            300: Color(hex: "#66BB8D"),
            400: Color(hex: "#33A567"),
            500: Color(hex: "#008E41"),
            600: Color(hex: "#007234"),
            700: Color(hex: "#005527"),
            800: Color(hex: "#00391A"),
            900: Color(hex: "#001C0D")
        ]

        subscript(index: Int) -> Color {
            return shades[index] ?? .black
        }
    }
    
    struct Palette_b {
        private let shades: [Int: Color] = [
            0: Color(hex: "#FFFFFF"),
            100: Color(hex: "#FDFDFB"),
            200: Color(hex: "#F9F9F4"),
            300: Color(hex: "#F2F2EA"),
            400: Color(hex: "#E9E9DB"),
            500: Color(hex: "#DDDDC8"),
            600: Color(hex: "#CDCDB0"),
            700: Color(hex: "#B8B894"),
            800: Color(hex: "#A0A078"),
            900: Color(hex: "#87875F")
        ]

        subscript(index: Int) -> Color {
            return shades[index] ?? .black
        }
    }
    
    struct Palette_g {
        private let shades: [Int: Color] = [
            0:  Color(hex: "#FFFFFF"),
            100: Color(hex: "#F9FBF9"),
            200: Color(hex: "#F1F5F1"),
            300: Color(hex: "#E5EBE5"),
            400: Color(hex: "#D6DCD6"),
            500: Color(hex: "#C2C9C2"),
            600: Color(hex: "#A8AEA8"),
            700: Color(hex: "#888E88"),
            800: Color(hex: "#636863"),
            900: Color(hex: "#3D403D")
        ]

        subscript(index: Int) -> Color {
            return shades[index] ?? .black
        }
    }
    
    struct Palette_s {
        private let named: [String: Color] = [
            "brown": Color(hex: "#251605"),
            "gray": Color(hex: "#1A1A1A"),
        ]
        
        subscript(key: String) -> Color {
            named[key] ?? .black
        }
    }

    static let p = Palette_p()
    static let b = Palette_b()
    static let g = Palette_g()
    static let s = Palette_s()
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b, a: UInt64
        switch hex.count {
        case 3:
            (r, g, b, a) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17, 255)
        case 6:
            (r, g, b, a) = (int >> 16, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b, a) = (1, 1, 1, 1)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
