//
//  Menu.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/3/25.
//

import SwiftUI

struct Menu: View {
    let type: MenuType
    let content: String
    
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
                Text(style.titleType)
                    .textStyle(TextStyle.caption1.bold)
                    .foregroundColor(.g[500])
                    .frame(width: 35, height: 20)
                    .background(Color.b[400])
                    .cornerRadius(100)
                Text(content)
                    .textStyle(TextStyle.caption1.bold)
                    .foregroundColor(.g[600])
                Spacer()
            }
            .frame(width: 256, alignment: .leading)
            .padding(.top)
        }
        .frame(width: 328, height: 94)
        .background(Color.b[300])
        .cornerRadius(10)
    }
    
    private var style: MenuStyle {
        MenuStyle(type: type)
    }
}

#Preview {
    HomeView()
}
