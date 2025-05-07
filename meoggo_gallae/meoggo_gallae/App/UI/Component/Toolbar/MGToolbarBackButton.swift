//
//  MGToolbarBackButton.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/7/25.
//

import SwiftUI

struct MGToolbarBackButton: ToolbarContent {
    let action: () -> Void

    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: action) {
                Image(Asset.back)
                    .resizable()
                    .frame(width: 23, height: 23)
                    .padding(.leading, 10)
            }
        }
    }
}
