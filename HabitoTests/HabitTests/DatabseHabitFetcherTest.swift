//
//  DatabseHabitFetcherTest.swift
//  HabitoTests
//
//  Created by admin on 2/11/25.
//

import XCTest
@testable import Habito

final class DatabseHabitFetcherTest: XCTestCase {

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
            let accountSpecificData : NSString = ("test: " + String(i)) as NSString
            try DatabaseAccountInserter.accountInserter.insertAccount(username: accountSpecificData, password: accountSpecificData, phoneNumber: accountSpecificData, email: accountSpecificData)
        }
    }

    func testFetchAccountHabits_noThrows_AccountExists() throws {
        try populateDataBaseWithAccounts(numberOfAccounts: 1)
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "test: 0")
        let accountID = fetchedAccount?.ID
        
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID!, name: "habit" as NSString, currentProgress: 1, goal: 10)
        
        XCTAssertNoThrow(try DatabaseHabitFetcher.habitFetcher.fetchAccountHabits(accountID: accountID!))
    }
    
    //TODO: FURTHER TESTING
}
