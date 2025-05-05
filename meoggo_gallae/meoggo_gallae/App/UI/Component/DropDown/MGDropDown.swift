//
//  MGDropdownBox.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/5/25.
//

import SwiftUI

struct MGDropDown: View {
    let options: [String]
    @Binding var selection: String
    @State private var isExpanded = false

    var body: some View {
        VStack(spacing: 0) {
            MGHeader(title: selection.isEmpty ? "선택하세요" : selection, isExpanded: $isExpanded)

            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(options.indices, id: \.self) { index in
                        let isLast = index == options.count - 1

                        Button(action: {
                            withAnimation {
                                selection = options[index]
                                isExpanded = false
                            }
                        }) {
                            Text(options[index])
                                .textStyle(TextStyle.caption1.default)
                                .foregroundColor(.s["brown"])
                                .padding(.vertical, 12)
                                .padding(.horizontal, 18)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.b[300])
                        }
                        .cornerRadius(
                            isLast ? 8 : 0,
                            corners: isLast ? [.bottomLeft, .bottomRight] : []
                        )
                    }
                }
            }
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
