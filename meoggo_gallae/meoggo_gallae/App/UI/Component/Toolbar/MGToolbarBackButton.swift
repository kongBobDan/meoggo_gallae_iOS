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
    var allRound: Int?

    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: action) {
                HStack(spacing: 6) {
                    Image(Asset.back)
                        .resizable()
                        .frame(width: 23, height: 23)

                    if foodselect == true {
                        HStack(spacing: 245) {
                            Text(roundText(for: round))
                                .textStyle(.title3.bold)
                                .foregroundColor(.black)

                            if let now = now, let allRound = allRound {
                                Text("\(now)/\(allRound)")
                                    .textStyle(.callout.default)
                                    .foregroundColor(.g[900])
                            }
                        }
                    }
                }
            }
        }
    }

    private func roundText(for round: Int?) -> String {
        guard let round = round else { return "" }
        switch round {
        case 2:
            return "결승"
        case 4:
            return "4강"
        case 8:
            return "8강"
        case 16:
            return "16강"
        case 32:
            return "32강"
        case 64:
            return "64강"
        case 128:
            return "128강"
        default:
            return "\(round)강"
        }
    }
}
