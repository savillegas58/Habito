//
//  DatabaseChallengeInsertTest.swift
//  HabitoTests
//
//  Created by admin on 2/12/25.
//

import XCTest
@testable import Habito

final class DatabaseChallengeInsertTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseFoundation.databaseFoundation.createDatabase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try DatabaseAccountDeleter.accountDeleter.deleteAllAccounts()
    }

    func testInsertChallenge_noThrows_nochallengesInExisitngAccount() throws {
        let test = "test"
        try DatabaseAccountInserter.accountInserter.insertAccount(username: test, password: test, phoneNumber: test, email: test)
        
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: test as String)
        
        XCTAssertNoThrow(try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: (fetchedAccount?.ID)!, name: "challenge", currentProgress: 1, goal: 1, date: "12-12-12"))
    }
    
    func test() throws {
        let test = "test"
        try DatabaseAccountInserter.accountInserter.insertAccount(username: test, password: test, phoneNumber: test, email: test)
        
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: test as String)

        let accountID = fetchedAccount?.ID
        
        try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: accountID!, name: "c", currentProgress: 0, goal: 0, date: "12-12-12")
        
        let fetchedChallenges = try DatabaseChallengeFetcher.challengeFetcher.fetchAccountsChallenges(accountID: accountID!)
        
        XCTAssertEqual(fetchedChallenges.count, 1)
    }

}
