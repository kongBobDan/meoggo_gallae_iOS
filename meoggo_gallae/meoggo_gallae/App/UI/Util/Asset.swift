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
    static let back = "BackButtonIcon"
    
    struct FoodSelect {
        static let onboarding = "FoodSelectOnboardingImage"
        static let ing = "FoodSelectingImage"
        static let text = "VSTextImage"
    }
    
    struct Food {
        static let dummy1 = "FoodDummyImage1"
        static let dummy2 = "FoodDummyImage2"
    }
    
    struct Result {
        struct Good {
            static let MG = "ResultGoodImage1"
            static let text = "ResultGoodImage2"
        }
        
        struct Soso {
            static let MG = "ResultSosoImage1"
            static let text = "ResultSosoImage2"
        }
        
        static let bad = "ResultBadImage"
    }
    
    struct Star {
        static let empty = "EmptyStarIcon"
        static let fill = "FillStarIcon"
    }
}
