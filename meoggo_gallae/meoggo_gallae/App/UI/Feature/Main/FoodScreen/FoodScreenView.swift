//
//  FoodScreenView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI
import PhotosUI

struct FoodScreenView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var grade: Int = 1
    @State private var classNumber: Int = 1
    @State private var studentNumber: Int = 1

    // 날짜 관련
    @State private var selectedYear: Int = Calendar.current.component(.year, from: Date()) - 2000
    @State private var selectedMonth: Int = Calendar.current.component(.month, from: Date())
    @State private var selectedDay: Int = Calendar.current.component(.day, from: Date())

    // 사진 선택 관련
    @State private var selectedPhotoItem: PhotosPickerItem? = nil
    @State private var selectedUIImage: UIImage? = nil

    // 버튼 누른 횟수 카운트
    @AppStorage("foodScreenButtonTapCount") private var tapCount: Int = 0

    // 네비게이션
    @State private var navigateToGood = false
    @State private var navigateToSoso = false
    @State private var navigateToBad = false

    var body: some View {
        ZStack {
            Color.b[200].ignoresSafeArea()
            VStack(spacing: 30) {
                PhotosPicker(
                    selection: $selectedPhotoItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    if let uiImage = selectedUIImage {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 258)
                            .clipped()
                            .cornerRadius(10)
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 258)
                                .frame(maxWidth: .infinity)
                            Text("+ 사진 추가")
                                .textStyle(.button.smalltext)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onChange(of: selectedPhotoItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            selectedUIImage = uiImage
                        }
                    }
                }

                Text("급식 먹은 날짜를 작성해주세요!")
                    .textStyle(TextStyle.largebodycopy.bold)

                HStack {
                    NumberPicker(range: 25...27, title: "년", selection: $selectedYear)
                    Spacer()
                    NumberPicker(range: 1...12, title: "월", selection: $selectedMonth)
                    Spacer()
                    NumberPicker(range: 1...31, title: "일", selection: $selectedDay)
                }
                .frame(width: 290)

                Spacer().frame(height: 100)

                MGButton(
                    title: "작성 완료",
                    type: .enabled,
                    size: .medium,
                    color: .dark,
                    action: {
                        tapCount += 1
                        print("작성 완료 \(tapCount)회")

                        switch tapCount % 3 {
                        case 1:
                            navigateToGood = true
                        case 2:
                            navigateToSoso = true
                        default:
                            navigateToBad = true
                        }
                    }
                )
                .frame(width: 333)
            }
            .toolbar {
                MGToolbarBackButton {
                    dismiss()
                }
            }
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $navigateToGood) {
                FoodScreenResultGoodView()
            }
            .navigationDestination(isPresented: $navigateToSoso) {
                FoodScreenResultSosoView()
            }
            .navigationDestination(isPresented: $navigateToBad) {
                if let image = selectedUIImage {
                    FoodScreenResultBadView(selectedImage: image)
                } else {
                    Text("이미지가 선택되지 않았습니다.")
                }
            }
        }
    }
}
