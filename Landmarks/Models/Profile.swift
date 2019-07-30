//
//  Profile.swift
//  Landmarks
//
//  Created by Vitor Capretz on 2019-07-30.
//  Copyright © 2019 Vitor Capretz. All rights reserved.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications: Bool
    var seasonalPhoto: Season
    var goalDate: Date
    
    static let `default` = Self(username: "vcapretz", prefersNotifications: true, seasonalPhoto: .summer)
    
    init(username: String, prefersNotifications: Bool = true, seasonalPhoto: Season = .summer) {
        self.username = username
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
    }
    
    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}
