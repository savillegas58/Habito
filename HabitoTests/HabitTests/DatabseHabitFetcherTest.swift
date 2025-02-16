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
        
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID!, name: "habit", currentProgress: 1, goal: 10, type: HabitType.drinking, date: "12-12-1212")
        
        XCTAssertNoThrow(try DatabaseHabitFetcher.habitFetcher.fetchAccountHabits(accountID: accountID!))
    }
    
    func testFetchAccountHabits_returns2_AccountHasMultipleHabits() throws {
        try populateDataBaseWithAccounts(numberOfAccounts: 1)
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "test: 0")
        let accountID = fetchedAccount?.ID
        
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID!, name: "habit", currentProgress: 1, goal: 10, type: HabitType.drinking, date: "12-12-1212")
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID!, name: "habit1", currentProgress: 3, goal: 10, type: HabitType.drinking, date: "12-12-1212")
        
        let fetchedHabits = try DatabaseHabitFetcher.habitFetcher.fetchAccountHabits(accountID: accountID!)
        XCTAssertEqual(fetchedHabits.count, 2)
    }
    
    func testACcountHabitFetch_retunrs1_2habits() throws {
        try populateDataBaseWithAccounts(numberOfAccounts: 1)
        let fetchedAvvount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "test: 0")
        let accountID = fetchedAvvount?.ID
        
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID!, name: "habit", currentProgress: 1, goal: 10, type: HabitType.drinking, date: "12-12-1212")
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID!, name: "habit1", currentProgress: 3, goal: 10, type: HabitType.walking, date: "12-12-1212")
        
        let fetchedHAbits = try DatabaseHabitFetcher.habitFetcher.fetchWalkingHabits(accountID: accountID!)
        XCTAssertEqual(fetchedHAbits.count, 1)
    }
    
    
    //TODO: FURTHER TESTING
}
