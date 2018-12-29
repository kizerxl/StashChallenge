//
//  AchievementInteractorTests.swift
//  StashChallengeTests
//
//  Created by Felix Changoo on 12/28/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import XCTest
@testable import StashChallenge

class AchievementInteractorTests: XCTestCase {
    var achievementInteractor: AchievementInteractor!
    var mockAchievementsService: MockAchievementsService!
    var mockPresenter: MockPresenter!
    
    override func setUp() {
        achievementInteractor = AchievementInteractor()
        mockAchievementsService = MockAchievementsService()
        mockPresenter = MockPresenter()
        
        achievementInteractor.presenter = mockPresenter
        achievementInteractor.achievementsService = mockAchievementsService
    }

    override func tearDown() {
        achievementInteractor = nil
        mockAchievementsService = nil
        mockPresenter = nil
    }

    func testWhenGetAchievementsIsCalledGetGetAchievementsIsCalledOffServiceInstance() {
        achievementInteractor.getAchievements()
        
        XCTAssertTrue(mockAchievementsService.getAchievementsCalled)
    }
    
    func testWhenonAchievementResultRecievedIsCalledMethodOfSameNameIsCalledOnPresenter() {
        let fakeResult = AchievementResult(titleInfo: TitleInfo(title: "fakeTitle"), achievements: [])
        
        achievementInteractor.onAchievementResultRecieved(with: fakeResult)
        
        XCTAssertTrue(mockPresenter.onAchievementResultRecievedCalled)
    }
}

class MockAchievementsService: AchievementsServiceInputProtocol {
    var decoder: JSONDecoderProtocol?
    var handler: AchievementsServiceOutputProtocol?
    
    var getAchievementsCalled = false
    
    func getAchievements() {
        getAchievementsCalled = true
    }
}

class MockPresenter: AchievementsInteractorOutputProtocol {
    var onAchievementResultRecievedCalled = false
    
    func onAchievementResultRecieved(with result: AchievementResult) {
        onAchievementResultRecievedCalled = true
    }
}
