//
//  AchievementRouter.swift
//  StashChallenge
//
//  Created by Felix Changoo on 12/27/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import UIKit

class AchievementRouter: AchievementsRouterProtocol {
    static func createAchievementsModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "AchievementNC")
        if let view = navController.children.first as? AchievementVC {
            
            let presenter: AchievementsPresenterProtocol & AchievementsInteractorOutputProtocol = AchievementPresenter()
            let interactor: AchievementsInteractorInputProtocol & AchievementsServiceOutputProtocol = AchievementInteractor()
            let service: AchievementsServiceInputProtocol = AchievementService()
            let router: AchievementsRouterProtocol = AchievementRouter()
            let decoder = JSONDecoder()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.achievementsService = service
            service.handler = interactor
            service.decoder = decoder
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
