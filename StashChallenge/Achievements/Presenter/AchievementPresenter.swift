//
//  AchievementPresenter.swift
//  StashChallenge
//
//  Created by Felix Changoo on 12/27/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import UIKit

class AchievementPresenter: AchievementsPresenterProtocol {
    weak var view: AchievementsViewProtocol?
    var interactor: AchievementsInteractorInputProtocol?
    var router: AchievementsRouterProtocol?
    
    func viewDidLoad() {
        interactor?.getAchievements()
    }
}

extension AchievementPresenter: AchievementsInteractorOutputProtocol {
    func onAchievementResultRecieved(with result: AchievementResult) {
        view?.updateView(with: result)
    }
}
