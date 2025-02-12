//
//  DatabaseChallengeUpdateTest.swift
//  HabitoTests
//
//  Created by admin on 2/12/25.
//

import XCTest
@testable import Habito

final class DatabaseChallengeUpdateTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseFoundation.databaseFoundation.createDatabase()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try DatabaseAccountDeleter.accountDeleter.deleteAllAccounts()
    }
    
    func testUpdateChallenge_challengeProgressIsUPdated_challenegeExists() throws {
        let testString = "test"
        try DatabaseAccountInserter.accountInserter.insertAccount(username: testString, password: testString, phoneNumber: testString, email: testString)
        
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: testString as String)
        
        let accountID = fetchedAccount?.ID
        
        try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: accountID!, name: "c", currentProgress: 0, goal: 10, date: "12-12-12")
        
        try DatabaseChallengeUpdater.challengeUpdater.updateAccountChallengeProgress(accountID: accountID!, challengeName: "c", newProgress: 10)
        
        let fetchedChallenges = try DatabaseChallengeFetcher.challengeFetcher.fetchAccountsChallenges(accountID: accountID!)
        
        XCTAssertEqual(fetchedChallenges[0].currentProgress, 10)
    }

}
