//
//  AchievementRootRouter.swift
//  StashChallenge
//
//  Created by Felix Changoo on 12/27/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import UIKit

class RootRouter: RootRouterProtocol {
    func presentAchievementScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = AchievementRouter.createAchievementsModule()
    }
}
