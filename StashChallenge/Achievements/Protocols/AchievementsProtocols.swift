//
//  AchievementsProtocols.swift
//  StashChallenge
//
//  Created by Felix Changoo on 12/27/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import UIKit

//view
protocol AchievementsViewProtocol: class {
    var presenter: AchievementsPresenterProtocol? {get set}
    
    func updateView(with result: AchievementResult)
}

//presenter
protocol AchievementsPresenterProtocol: class {
    var view: AchievementsViewProtocol? {get set}
    var interactor: AchievementsInteractorInputProtocol? {get set}
    var router: AchievementsRouterProtocol? {get set}
    
    //View -> Presenter
    func viewDidLoad()
}

//interactor
protocol AchievementsInteractorInputProtocol: class {
    var presenter: AchievementsInteractorOutputProtocol? {get set}
    var achievementsService: AchievementsServiceInputProtocol? {get set}
    
    //Presenter -> Interactor
    func getAchievements()
}

protocol AchievementsInteractorOutputProtocol: class {
    //Interactor -> Presenter
    func onAchievementResultRecieved(with result: AchievementResult)
}

protocol AchievementsServiceInputProtocol: class {
    var handler: AchievementsServiceOutputProtocol? {get set}
    var decoder: JSONDecoderProtocol? {get set}
    
    //Interactor -> Local Storage
    func getAchievements()
}

//storage
protocol AchievementsServiceOutputProtocol: class {
    //LocalStorage -> Interactor
    func onAchievementResultRecieved(with result: AchievementResult)
}

//router
protocol AchievementsRouterProtocol: class {
    static func createAchievementsModule() -> UIViewController
}

