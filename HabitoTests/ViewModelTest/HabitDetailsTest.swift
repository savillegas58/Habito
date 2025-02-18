//
//  HabitDetailsTest.swift
//  HabitoTests
//
//  Created by admin on 2/18/25.
//

import XCTest
@testable import Habito

final class HabitDetailsTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseAccountInserter.accountInserter.insertAccount(username: "testAccount", password: "", phoneNumber: "", email: "")
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "testAccount")
        let fetchedAccountID = fetchedAccount?.ID
        
        UserDefaults.standard.set(fetchedAccountID, forKey: "currentAccountID")
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: fetchedAccountID!, name: "new habit", currentProgress: 0, goal: 10, type: HabitType.drinking, date: "1-1-1111")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        DatabaseAccountDeleter.accountDeleter.deleteAccountByName(username: "testAccount")
    }

    func testUpdateHabitProgress_habitProgressis8_habitProgressIs0() throws {
        let expectedResult = 8
        
        HabitDetailsViewModel.habitUpdater.updateHabitProgress(habitName: "new habit", newProgress: 8)
        
        let updatedHabit = HabitViewModel.habitFetcher.getCurrentAccountHabits().first
        
        XCTAssertEqual(updatedHabit?.currentProgress, expectedResult)
    }
}
