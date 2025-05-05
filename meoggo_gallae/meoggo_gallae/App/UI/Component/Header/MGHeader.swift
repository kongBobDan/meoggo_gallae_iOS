//
//  MGHeader.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/5/25.
//

import SwiftUI

struct MGHeader: View {
    let title: String
    @Binding var isExpanded: Bool

    var body: some View {
        Button(action: {
            withAnimation {
                isExpanded.toggle()
            }
        }) {
            HStack {
                Text(title)
                    .textStyle(TextStyle.caption1.default)
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
            }
            .foregroundColor(isExpanded ? .g[700] : .g[900])
            .padding(.vertical)
            .padding(.horizontal, 18)
            .background(isExpanded ? Color.b[400] : Color.b[300])
            .cornerRadius(
                isExpanded ? 8 : 8,
                corners: isExpanded ? [.topLeft, .topRight] : [.allCorners]
            )
        }
    }
}
