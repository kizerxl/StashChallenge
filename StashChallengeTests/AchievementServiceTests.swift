//
//  AchievementServiceTests.swift
//  StashChallengeTests
//
//  Created by Felix Changoo on 12/28/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import XCTest
@testable import StashChallenge

class AchievementServiceTests: XCTestCase {
    var achievementService: AchievementService!
    var mockJSONDecoder: MockJSONDecoder!
    var mockHandler: MockHandler!
    
    override func setUp() {
        achievementService = AchievementService()
        mockJSONDecoder = MockJSONDecoder()
        mockHandler = MockHandler()
        
        achievementService.handler = mockHandler
        achievementService.decoder = mockJSONDecoder
    }
    
    override func tearDown() {
        achievementService = nil
    }
    
    func testWhenGetAchievementsIsCalledOnAchievementResultRecievedCalledFromHandler() {
        achievementService.getAchievements()
        
        XCTAssertTrue(mockHandler.onAchievementResultRecievedCalled)
    }
}



class MockJSONDecoder: JSONDecoderProtocol {
    let fakeResult: Decodable = AchievementResult(titleInfo: TitleInfo(title: "fakeTitle"), achievements: [])
    
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
        return fakeResult as! T
    }
}

class MockHandler: AchievementsServiceOutputProtocol {
    var onAchievementResultRecievedCalled = false
    
    func onAchievementResultRecieved(with result: AchievementResult) {
        onAchievementResultRecievedCalled = true
    }
}
