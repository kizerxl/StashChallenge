//
//  JSONResult.swift
//  StashChallenge
//
//  Created by Felix Changoo on 12/27/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import UIKit

struct TitleInfo: Codable {
    let title: String
}

struct Achievement: Codable {
    let level: String
    let progress: Int
    let total: Int
    let bg_image_url: String
    let accessible: Bool
}

struct AchievementResult: Codable {
    enum CodingKeys : String, CodingKey {
        case titleInfo = "overview"
        case achievements
    }
    
    let titleInfo: TitleInfo
    let achievements: [Achievement]
}
