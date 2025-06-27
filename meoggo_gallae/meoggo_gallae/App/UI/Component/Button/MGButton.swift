//
//  MGButton.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/19/25.
//

import SwiftUI

struct MGButton: View {
    let title: String
    let type: MGButtonType
    let size: MGButtonSize
    let color: MGButtonColor
    let ricon: String? = nil
    let licon: String? = nil

    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Group {
                if size == .medium {
                    HStack {
                        if let left = licon {
                            Image(systemName: left)
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        Text(title)
                        if let right = ricon {
                            Image(systemName: right)
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                } else {
                    Text(title)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: style.height)
        }
        .textStyle(style.textStyle)
        .foregroundColor(style.textColor)
        .background(style.backgroundColor)
        .cornerRadius(6)
    }

    private var style: MGButtonStyle {
        MGButtonStyle(type: type, size: size, color: color)
    }
}

