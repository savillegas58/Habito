//
//  DatabasseHabitUpdateTest.swift
//  HabitoTests
//
//  Created by admin on 2/11/25.
//

import XCTest
@testable import Habito

final class DatabasseHabitUpdateTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseFoundation.databaseFoundation.createDatabase()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try DatabaseAccountDeleter.accountDeleter.deleteAllAccounts()
    }

    func testUpdateAccountHabitProgeress_habitIsUpdated_accountAndHAbitExist() throws {
        let testString = "test"
        try DatabaseAccountInserter.accountInserter.insertAccount(username: testString, password: testString, phoneNumber: testString, email: testString)
        
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: testString as String)
        
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: (fetchedAccount?.ID)!, name: "testHabit", currentProgress: 0, goal: 10, type: HabitType.drinking, date: "12-12-1212")
        
        try DatabaseHabitUpdater.habitUpdater.updateAccountHabitProgress(accountID: (fetchedAccount?.ID)!, habitName: "testHabit", newProgress: 5)
        
        let fetchedHabits = try DatabaseHabitFetcher.habitFetcher.fetchAccountHabits(accountID: (fetchedAccount?.ID)!)
        
        
        XCTAssertEqual(fetchedHabits[0].currentProgress, 5)
    }
}
