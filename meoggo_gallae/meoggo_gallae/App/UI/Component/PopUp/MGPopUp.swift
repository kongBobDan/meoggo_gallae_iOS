//
//  MGPopUp.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/7/25.
//

import SwiftUI

struct MGPopUp: View {
    var onYes: () -> Void
    var onNo: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                VStack(spacing: 5) {
                    Text("정말 돌아가시겠습니까?")
                        .textStyle(TextStyle.largebodycopy.bold)
                    
                    Text("돌아가시면 되돌아가지 못합니다.")
                        .textStyle(TextStyle.caption1.default)
                        .foregroundColor(.b[700])
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 55)
                .padding(.bottom, 45)
                .background(Color.b[200])
                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                
                Rectangle()
                    .foregroundColor(.b[500])
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
            }
            HStack {
                Button("네") {
                    onYes()
                }
                .textStyle(TextStyle.body.bold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                
                Rectangle()
                    .foregroundColor(.b[500])
                    .frame(width: 1, height: 43)
                
                Button("아니오") {
                    onNo()
                }
                .foregroundColor(.black)
                .textStyle(TextStyle.body.bold)
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 5)
            .background(Color.b[200])
            .clipShape(RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight]))
        }
        .frame(width: 333)
    }
}
