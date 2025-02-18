//
//  HabitTest.swift
//  HabitoTests
//
//  Created by admin on 2/18/25.
//

import XCTest
@testable import Habito

final class HabitTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseAccountInserter.accountInserter.insertAccount(username: "AccountForTesting_.", password: "password", phoneNumber: "", email: "")
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "AccountForTesting_.")
        let fetchedAccountID = fetchedAccount?.ID
        UserDefaults.standard.set(fetchedAccountID, forKey: "currentAccountID")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        DatabaseAccountDeleter.accountDeleter.deleteAccountByName(username: "AccountForTesting_.")
    }

    func testGetAccountHabits_returnsEmptyArray_noHabitsInAccount() throws {
        let expectedResult = [Habit]()
        
        let retreivedHabits = HabitViewModel.habitFetcher.getCurrentAccountHabits()
        
        XCTAssertEqual(retreivedHabits.count, expectedResult.count)
    }
    
    //add test that checks habit contents to make sure?
    func testGetAccounthabits_returnsArrayofApproproateLength_2habitInAccount() throws {
        let expectedResult = 2
        
        let accountID = UserDefaults.standard.integer(forKey: "currentAccountID")
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID, name: "1", currentProgress: 0, goal: 10, type: HabitType.drinking, date: "1")
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID, name: "2", currentProgress: 0, goal: 10, type: HabitType.walking, date: "1")
        
        let retreievedhabits = HabitViewModel.habitFetcher.getCurrentAccountHabits()
        
        XCTAssertEqual(retreievedhabits.count, expectedResult)
    }
    
    func testCalcProggress_returns50_HabitIs5Of10() throws {
        let expectedResult = 50
        let accountID = UserDefaults.standard.integer(forKey: "currentAccountID")
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID, name: "1", currentProgress: 5, goal: 10, type: HabitType.drinking, date: "1")
        
        let habitToCalc = HabitViewModel.habitFetcher.getAnySingleHabit()
        let progress = HabitViewModel.habitFetcher.progressPercentage
        
        XCTAssertEqual(progress, expectedResult)
        
    }

    func testCalcProgresss_returns25_Habbitis1Of4() throws {
        let expectedResult = 25
        let accountID = UserDefaults.standard.integer(forKey: "currentAccountID")
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID, name: "1", currentProgress: 1, goal: 4, type: HabitType.drinking, date: "1")
        
        let habitToCalc = HabitViewModel.habitFetcher.getAnySingleHabit()
        let progress = HabitViewModel.habitFetcher.progressPercentage
        
        XCTAssertEqual(progress, expectedResult)
    }

}
