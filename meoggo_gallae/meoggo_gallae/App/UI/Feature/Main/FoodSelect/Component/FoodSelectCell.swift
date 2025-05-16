//
//  FoodSelectCell.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodSelectCell: View {
    let image: String
    let name: String
    
    var body: some View {
        VStack {
            FoodImageCell(image: image, width: 333, height: 220)
            Text(name)
                .textStyle(TextStyle.foodname)
        }
    }
}
