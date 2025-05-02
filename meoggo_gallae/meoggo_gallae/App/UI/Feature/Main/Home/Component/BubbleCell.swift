//
//  BubbleCell.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/2/25.
//

import SwiftUI

struct BubbleCell: View {
    let content: String
    let imageName: String?
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Triangle()
                .foregroundColor(.p[800])
                .frame(width: 25, height: 25)
                .padding(.trailing, 15)
                .padding(.top, 10)
                .rotationEffect(.degrees(-30))
            
            HStack(spacing: 4) {
                Text(content)
                    .textStyle(TextStyle.Caption1.default)
                if let imageName {
                    Image(imageName)
                        .resizable()
                        .frame(width: 14, height: 14)
                }
            }
            .textStyle(TextStyle.Caption1.default)
            .padding(.horizontal, 20)
            .frame(height: 26)
            .foregroundColor(.b[0])
            .background(Color.p[800])
            .cornerRadius(5)
        }
    }
    
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.closeSubpath()
            return path
        }
    }
}
