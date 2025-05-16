//
//  EndGreenText.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/16/25.
//

import SwiftUI

struct EndGreenText: View {
    let text: String
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(Array(text), id: \.self) { char in
                VStack(spacing: 2) {
                    Circle()
                        .frame(width: 7, height: 7)
                    Text(String(char))
                        .textStyle(TextStyle.title1.bold)
                }
            }
        }
        .foregroundColor(.p[500])
    }
}
