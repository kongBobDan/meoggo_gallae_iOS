//
//  HomeView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/27/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()
            ScrollView {
                VStack(spacing: 45) {
                    DonutChart()
                        .padding(.top, -(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) ?? 0)
                    VStack(spacing: 10) {
                        ConfrontationButton()
                        CameraButton()
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Image(Asset.Home.calendar)
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text("오늘 급식")
                                .textStyle(TextStyle.title2.bold)
                        }
                        Menu(type: .morning, content: "발아현미밥, 잡채, 배추김치, 해물순두부찌개, 연탄대패불고기, 청포도")
                        Menu(type: .lunch, content: "발아현미밥, 잡채, 배추김치, 해물순두부찌개, 연탄대패불고기, 청포도")
                        Menu(type: .dinner, content: "발아현미밥, 잡채, 배추김치, 해물순두부찌개, 연탄대패불고기, 청포도")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView()
}
