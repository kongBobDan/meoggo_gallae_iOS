//
//  OnboardingFirstView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/24/25.
//

import SwiftUI

struct OnboardingFirstView: View {
    @State private var next: Bool = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 40) {
                NumberPicker(range: 1...3, title: "학년")
                NumberPicker(range: 1...4, title: "반")
                NumberPicker(range: 1...20, title: "번")
            }
            VStack {
                Spacer()
                    .frame(height: 100)
                Text("안녕!")
                    .textStyle(TextStyle.title1.bold)
                Text("네가 누군지를 알려 줘!")
                    .textStyle(TextStyle.title1.bold)
                Spacer()
                    MGButton (
                        title: "입력 완료",
                        type: .focused,
                        size: .medium,
                        color: .dark,
                        action: {
                            next = true
                        }
                    )
            }
            .frame(width: 333)
            .padding(.bottom)
            NavigationLink(destination: OnboardingSecondView(), isActive: $next) {
                EmptyView()
            }
        }
    }
}

#Preview {
    OnboardingFirstView()
}
