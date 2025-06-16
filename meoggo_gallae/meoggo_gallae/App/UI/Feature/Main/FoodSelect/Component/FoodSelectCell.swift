//
//  FoodSelectCell.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodSelectCell: View {
    let imagePath: String
    let name: String

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "http://0.0.0.0:3000/" + imagePath)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 150, height: 150)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }

            Text(name)
                .font(.headline)
                .padding(.top, 8)
        }
    }
}
