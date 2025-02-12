//
//  DatabaseChallengeDeleteTest.swift
//  HabitoTests
//
//  Created by admin on 2/12/25.
//

import XCTest
@testable import Habito

final class DatabaseChallengeDeleteTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseFoundation.databaseFoundation.createDatabase()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try DatabaseAccountDeleter.accountDeleter.deleteAllAccounts()
    }
    
    func populateDataBaseWithAccounts(numberOfAccounts: Int) throws {
        for i in 0..<numberOfAccounts {
            let accountSpecificData = ("test: " + String(i))
            try DatabaseAccountInserter.accountInserter.insertAccount(username: accountSpecificData, password: accountSpecificData, phoneNumber: accountSpecificData, email: accountSpecificData)
        }
    }
    
    func testDeleteChallenggesFromAccount_removeChallenges_accountExistsWithChallenges() throws {
        try populateDataBaseWithAccounts(numberOfAccounts: 1)
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "test: 0")
        let accountID = fetchedAccount?.ID
        
        try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: accountID!, name: "challenge", currentProgress: 0, goal: 10, date: "12-12-12")
        
        try DatabaseChallengeDeleter.challengeDeleter.deleteAllChallengesFromAccount(accountID: accountID!)
        
        let fetchedChallenges = try DatabaseChallengeFetcher.challengeFetcher.fetchAccountsChallenges(accountID: accountID!)
        
        XCTAssertEqual(fetchedChallenges.count, 0)
    }

}
