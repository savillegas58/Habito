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
            let accountSpecificData = ("test: " + String(i))
            try DatabaseAccountInserter.accountInserter.insertAccount(username: accountSpecificData, password: accountSpecificData, phoneNumber: accountSpecificData, email: accountSpecificData)
        }
    }

    func testFetchAccountHabits_noThrows_AccountExists() throws {
        try populateDataBaseWithAccounts(numberOfAccounts: 1)
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "test: 0")
        let accountID = fetchedAccount?.ID
        
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID!, name: "habit", currentProgress: 1, goal: 10)
        
        XCTAssertNoThrow(try DatabaseHabitFetcher.habitFetcher.fetchAccountHabits(accountID: accountID!))
    }
    
    func testFetchAccountHabits_returns2_AccountHasMultipleHabits() throws {
        try populateDataBaseWithAccounts(numberOfAccounts: 1)
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "test: 0")
        let accountID = fetchedAccount?.ID
        
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID!, name: "habit", currentProgress: 1, goal: 10)
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID!, name: "habit1", currentProgress: 3, goal: 10)
        
        let fetchedHabits = try DatabaseHabitFetcher.habitFetcher.fetchAccountHabits(accountID: accountID!)
        XCTAssertEqual(fetchedHabits.count, 2)
    }
    
    
    //TODO: FURTHER TESTING
}
