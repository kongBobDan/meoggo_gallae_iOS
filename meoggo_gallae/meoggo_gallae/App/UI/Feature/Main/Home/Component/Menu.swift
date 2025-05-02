//
//  Menu.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/2/25.
//

import SwiftUI

struct Menu: View {
    let type: MenuType
    var content: String

    var body: some View {
        HStack(spacing: 14) {
            Image(style.iconStyle)
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.leading)
            Rectangle()
                .frame(width: 1)
                .foregroundColor(.b[400])
            VStack(alignment: .leading, spacing: 5) {
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(.b[400])
                        .frame(width: 35, height: 20)
                    Text(style.title)
                        .textStyle(TextStyle.caption1.bold)
                        .foregroundColor(.g[500])
                }
                Text(content)
                    .textStyle(TextStyle.caption1.default)
                    .foregroundColor(.g[600])
            }
            .frame(width: 256, alignment: .leading)
        }
        .frame(width: 328, height: 94)
        .background(Color.b[300])
        .cornerRadius(10)
    }
    
    private var style: MenuStyle {
        MenuStyle(type: type)
    }
}
