//
//  Asset.swift
//  meoggo_gallae
//
//  Created by 이다경 on 4/22/25.
//

import SwiftUI

class Asset {
    struct Onboarding {
        static let second = "SecondImage"
        static let third = "ThirdImage"
        struct fourth {
            static let ver1 = "Fourth1verImage"
            static let ver2 = "Fourth2verImage"
        }
    }
    struct Logo {
        static let font = "LogoFont"
        static let icon = "LogoIcon"
    }
    struct Home {
        static let confrontation = "ConfrontationImage"
        static let morning = "MorningIcon"
        static let lunch = "LunchIcon"
        static let dinner = "DinnerIcon"
        static let heart = "HeartIcon"
        struct Camera {
            static let check = "CameraCheckIcon"
            static let next = "CameraNextIcon"
        }
        static let calendar = "CalendarIcon"
    }
}
