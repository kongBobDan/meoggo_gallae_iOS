//
//  CameraButton.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/3/25.
//

import SwiftUI

struct CameraButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(Asset.Home.Camera.check)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 20)
                Text("오늘의 잔반량 체크하러 가기")
                    .textStyle(TextStyle.body.default)
                    .foregroundColor(.b[0])
                Spacer()
                Image(Asset.Home.Camera.next)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 20)
            }
            .frame(width: 333, height: 80)
            .background(Color.s["gray"])
            .cornerRadius(10)
        }
    }
}
