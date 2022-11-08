//
//  Profile.swift
//  Landmarks
//
//  Created by Евгения Шевцова on 08.11.2022.
//

import Foundation

struct Profile {
    static let `default` = Profile(userName: "Jane", prefersNotifications: true)
    
    var userName: String
    var prefersNotifications: Bool
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "☘️"
        case summer = "🌞"
        case autumn = "☔️"
        case winter = "❄️"
        
        var id: String { rawValue }
    }
    
}

