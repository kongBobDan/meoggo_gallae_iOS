//
//  MGToolbarBackButton.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/7/25.
//

import SwiftUI

struct MGToolbarBackButton: ToolbarContent {
    let action: () -> Void
    var foodselect: Bool?
    var round: Int?
    var now: Int?

    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: action) {
                HStack(spacing: 6) {
                    Image(Asset.back)
                        .resizable()
                        .frame(width: 23, height: 23)

                    if foodselect == true {
                        HStack(spacing: 245) {
                            Text("\(round ?? 0)강")
                                .textStyle(.title3.bold)
                            if let round = round, let now = now {
                                Text("\(round)/\(now)")
                                    .textStyle(.callout.default)
                                    .foregroundColor(.g[900])
                            }
                        }
                    }
                    
                }
            }
        }
    }
}
