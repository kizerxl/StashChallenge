//
//  AchievementInteractor.swift
//  StashChallenge
//
//  Created by Felix Changoo on 12/27/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import UIKit

class AchievementInteractor: AchievementsInteractorInputProtocol {
    var achievementsService: AchievementsServiceInputProtocol?
    weak var presenter: AchievementsInteractorOutputProtocol?
    
    func getAchievements() {
        achievementsService?.getAchievements()
    }
}

extension AchievementInteractor: AchievementsServiceOutputProtocol {
    func onAchievementResultRecieved(with result: AchievementResult) {
        presenter?.onAchievementResultRecieved(with: result)
    }
}
