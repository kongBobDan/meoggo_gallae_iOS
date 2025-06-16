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
            AsyncImage(url: URL(string: "http://0.0.0.0:3000/" + image)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 180, height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(name)
                .font(.title3)
        }
    }
}
