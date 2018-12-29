//
//  AchievementStorage.swift
//  StashChallenge
//
//  Created by Felix Changoo on 12/27/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import UIKit

class AchievementService: AchievementsServiceInputProtocol {
    weak var handler: AchievementsServiceOutputProtocol?
    var decoder: JSONDecoderProtocol?
    
    func getAchievements() {
        if let url = Bundle.main.url(forResource: "achievements", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let result = try decoder?.decode(AchievementResult.self, from: data)
                handler?.onAchievementResultRecieved(with: result!)
            } catch {
                print("error:\(error)")
            }
        }
    }
}
