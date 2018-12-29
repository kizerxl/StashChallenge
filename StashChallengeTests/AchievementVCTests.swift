//
//  AchievementVCTests.swift
//  StashChallengeTests
//
//  Created by Felix Changoo on 12/28/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import XCTest
@testable import StashChallenge

class AchievementVCTests: XCTestCase {
    var achievementVC: AchievementVC!
    var fakeAchievements: [Achievement] = []
    var tv: UITableView!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navController = storyboard.instantiateInitialViewController() as! UINavigationController
        tv = UITableView()
        
        achievementVC = navController.children.first as! AchievementVC
        achievementVC.tableView = tv
        
        fakeAchievements = [
           Achievement(level: "1", progress: 0, total: 10, bg_image_url: "none", accessible: false),
           Achievement(level: "2", progress: 5, total: 10, bg_image_url: "none", accessible: false),
           Achievement(level: "3", progress: 8, total: 10, bg_image_url: "none", accessible: false),
           Achievement(level: "4", progress: 2, total: 10, bg_image_url: "none", accessible: false)
        ]
    }
    
    override func tearDown() {
        achievementVC = nil
    }
    
    func testAchievementVCShouldHaveCorrectNumberOfRowsInTableViewWhenAchievementsArePassedToAchievementVC() {
        let section = 0
        achievementVC.achievements = fakeAchievements
        
        let tableViewRows = achievementVC.tableView(tv, numberOfRowsInSection: section)
        
        XCTAssertEqual(tableViewRows, 4)
    }
    
    func testAchievementVCShouldHaveUpdatedTitleWhenResultIsPassedToUpdateView() {
        let fakeResult = AchievementResult(titleInfo: TitleInfo(title: "fakeTitle"), achievements: [])
        
        achievementVC.updateView(with: fakeResult)
    
        XCTAssertEqual(achievementVC.navigationItem.title, "fakeTitle")
    }

}


