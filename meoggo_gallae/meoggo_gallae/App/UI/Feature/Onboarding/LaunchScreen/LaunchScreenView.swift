//
//  LaunchScreenView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/24/25.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(Asset.Logo.icon)
                .resizable()
                .frame(width: 118, height: 130)
            Image(Asset.Logo.font)
                .resizable()
                .frame(width: 156, height: 45)
            Text("Loading...")
                .textStyle(TextStyle.largebodycopy.bold)
                .foregroundColor(.s["gray"])
        }
    }
}

#Preview {
    LaunchScreenView()
}
