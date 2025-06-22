//
//  FoodSelectCell.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

struct FoodSelectCell: View {
    let image: String  // 완성된 URL string
    let name: String

    var body: some View {
        VStack {
            if let url = URL(string: image) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure(let error):
                        Color.gray.opacity(0.3)
                        Text("이미지를 불러올수 없습니다.")
                            .foregroundColor(.black)
                    @unknown default:
                        Color.black
                    }
                }
                .frame(width: 333, height: 230)
                .clipped()
            } else {
                Color.red
                Text("❌ 잘못된 URL")
            }

            Text(name)
                .textStyle(.foodname)
                .foregroundColor(.s["brown"])
        }
    }
}
