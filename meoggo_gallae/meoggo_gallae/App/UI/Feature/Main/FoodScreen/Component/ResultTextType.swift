//
//  ResultTextType.swift
//  meoggo_gallae
//
//  Created by 이다경 on 5/15/25.
//

import SwiftUI

enum ResultTextType {
    case good, soso, bad
}

struct ResultTextStyle {
    let type: ResultTextType

    var title: String {
        switch type {
        case .good: return "오늘 급식에서 남은 잔반을 찾지못하였어요!"
        case .soso: return "오늘 급식은 맛있게 드셨나요? 맛있게 드셨다면 충분합니다!"
        case .bad: return "잔반이 너무 많이 남았어요.. 다음부터는 받는 양을 줄여봐요!"
        }
    }

    var bubble1: String {
        switch type {
        case .good: return "오늘 급식 겁나 맛있나본데??"
        case .soso: return "ㄹㅇㅋㅋ"
        case .bad: return "님 소식좌예요?"
        }
    }
    
    var bubble2: String {
        switch type {
        case .good: return "엄청나!!!"
        case .soso: return "대소고 급식은 좀 레전드긴함;"
        case .bad: return "음.. 다음에는 좀 줄여야겠다~"
        }
    }
}
