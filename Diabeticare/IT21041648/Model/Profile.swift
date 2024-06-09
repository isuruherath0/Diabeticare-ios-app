//
//  Profile.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-08.
//

import Foundation

struct Profile {
    var username: String
    var bloodSugar: Double
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    var gender = Gender.male

    static let `default` = Profile(username: "Isuru Herath", bloodSugar: 120)

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🛏️"
        case summer = "👨🏻‍🦽"
        case autumn = "🚶🏻‍♂️"
        case winter = "🏃🏻‍♂️"

        var id: String { rawValue }
    }

    enum Gender: String, CaseIterable, Identifiable {
        case male = "Male"
        case female = "Female"

        var id: String { rawValue }
    }
}


