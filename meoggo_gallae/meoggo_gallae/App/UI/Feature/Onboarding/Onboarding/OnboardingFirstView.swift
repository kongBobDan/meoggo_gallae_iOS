//
//  OnboardingFirstView.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/24/25.
//

import SwiftUI
import Combine

struct OnboardingFirstView: View {
    @State private var next: Bool = false
    @State private var goHome: Bool = false
    @State private var errorMessage: String = ""
    @State private var cancellable: AnyCancellable?

    @State private var grade: Int = 1
    @State private var classNumber: Int = 1
    @State private var studentNumber: Int = 1

    private let userApi = UserApi()
    private let savedUsersKey = "savedUsersList"

    var body: some View {
        ZStack {
            HStack(spacing: 40) {
                NumberPicker(range: 1...3, title: "학년", selection: $grade)
                NumberPicker(range: 1...4, title: "반", selection: $classNumber)
                NumberPicker(range: 1...20, title: "번", selection: $studentNumber)
            }
            VStack {
                Spacer().frame(height: 100)
                Text("안녕!").textStyle(TextStyle.title1.bold)
                Text("네가 누군지를 알려 줘!").textStyle(TextStyle.title1.bold)
                Spacer()
                MGButton(
                    title: "입력 완료",
                    type: .focused,
                    size: .medium,
                    color: .dark,
                    action: {
                        login()
                    }
                )
            }
            .frame(width: 333)
            .padding(.bottom)

            NavigationLink(destination: OnboardingSecondView(), isActive: $next) { EmptyView() }
            NavigationLink(destination: HomeView(), isActive: $goHome) { EmptyView() }
        }
    }

    func login() {
        let body = LoginRequest(grade: grade, classNumber: classNumber, studentNumber: studentNumber)
        print("로그인 요청 바디:", body)

        cancellable = userApi.login(body: body)
            .sink { response in
                print("전체 응답: \(response)")
                print("HTTP 상태 코드:", response.response?.statusCode ?? -1)
                print("에러:", response.error ?? "없음")

                if let value = response.value {
                    print("응답 데이터:", value)
                    if value.success {
                        let currentUser = UserKey(grade: grade, classNumber: classNumber, studentNumber: studentNumber)
                        let savedUsers = loadSavedUsers()
                        print("저장된 사용자 리스트:", savedUsers)
                        
                        if savedUsers.contains(currentUser) {
                            print("기존 회원, 홈으로 이동")
                            self.goHome = true
                        } else {
                            print("신규 회원, 사용자 저장 후 온보딩 계속 진행")
                            saveUser(currentUser)
                            self.next = true
                        }
                    } else {
                        print("로그인 실패: success == false")
                        self.errorMessage = "로그인 실패: success == false"
                    }
                } else {
                    print("로그인 실패 응답 데이터 없음")
                    self.errorMessage = "로그인 실패 다시 시도해 주세요."
                }
            }
    }

    func loadSavedUsers() -> [UserKey] {
        return UserDefaults.standard.getCodable(forKey: savedUsersKey, as: [UserKey].self) ?? []
    }

    func saveUser(_ user: UserKey) {
        var users = loadSavedUsers()
        if !users.contains(user) {
            users.append(user)
            UserDefaults.standard.setCodable(users, forKey: savedUsersKey)
            print("회원가입 사용자 저장됨:", user)
        }
    }
}

extension UserDefaults {
    func setCodable<T: Codable>(_ value: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            self.set(encoded, forKey: key)
        }
    }
    
    func getCodable<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        guard let data = self.data(forKey: key) else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode(type, from: data)
    }
}
