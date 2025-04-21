//
//  MGTextField.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/21/25.
//

import SwiftUI

struct MGTextField: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        VStack {
            HStack {
                TextField(placeholder, text: $text)
                    .textStyle.body.default
                    .padding(.leading, 18)
                Spacer()
            }
            .background(
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
            )
        }
    }
}
