//
//  AchievementPresenterTests.swift
//  StashChallengeTests
//
//  Created by Felix Changoo on 12/28/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import XCTest
@testable import StashChallenge

class AchievementPresenterTests: XCTestCase {
    var achievementPresenter: AchievementPresenter!
    var mockAchievementView: MockAchievementView!
    var mockAchievementInteractor: MockAchievementInteractor!

    override func setUp() {
        achievementPresenter = AchievementPresenter()
        mockAchievementView = MockAchievementView()
        mockAchievementInteractor = MockAchievementInteractor()
        
        achievementPresenter.interactor = mockAchievementInteractor
        achievementPresenter.view = mockAchievementView
    }

    override func tearDown() {
        achievementPresenter = nil
        mockAchievementView = nil
        mockAchievementInteractor = nil
    }

    func testWhenViewDidLoadGetsCalledgetAchievementsIsCalledOffTheInteractor() {
        achievementPresenter.viewDidLoad()
        
        XCTAssertTrue(mockAchievementInteractor.getAchievementsCalled)
    }

    func testonAchievementResultRecievedIsCalledUpdateViewIsCalledOffView() {
        let fakeResult = AchievementResult(titleInfo: TitleInfo(title: "fakeTitle"), achievements: [])
        
        achievementPresenter.onAchievementResultRecieved(with: fakeResult)
        
        XCTAssertTrue(mockAchievementView.updateViewCalled)
    }

}

class MockAchievementView: AchievementsViewProtocol {
    var presenter: AchievementsPresenterProtocol?
    var updateViewCalled = false
    
    func updateView(with result: AchievementResult) {
        updateViewCalled = true
    }
}

class MockAchievementInteractor: AchievementsInteractorInputProtocol {
    var presenter: AchievementsInteractorOutputProtocol?
    var achievementsService: AchievementsServiceInputProtocol?
    var getAchievementsCalled = false
    
    func getAchievements() {
        getAchievementsCalled = true
    }
}
