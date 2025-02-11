//
//  DatabseHabitInserterTest.swift
//  HabitoTests
//
//  Created by admin on 2/11/25.
//

import XCTest
@testable import Habito

final class DatabseHabitInserterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseFoundation.databaseFoundation.createDatabase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try DatabaseAccountDeleter.accountDeleter.deleteAllAccounts()
    }

    func testInsertHabit_noThrows_ExistantAccountWithNoHabits() throws {
        let test : NSString = "test"
        try DatabaseAccountInserter.accountInserter.insertAccount(username: test, password: test, phoneNumber: test, email: test)
        
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: test as String)
        
        XCTAssertNoThrow(try DatabaseHabitInserter.habitInserter.insertHabit(accountID: (fetchedAccount?.ID)!, name: "habit" as NSString, currentProgress: 1, goal: 1))
    }

}
