//
//  DataAnalyzeTest.swift
//  HabitoTests
//
//  Created by admin on 2/18/25.
//

import XCTest
@testable import Habito

final class DataAnalyzeTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseAccountInserter.accountInserter.insertAccount(username: "testAccount_.", password: "", phoneNumber: "", email: "")
        let account = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "testAccount_.")
        let accountID = account?.ID
        UserDefaults.standard.set(accountID!, forKey: "currentAccountID")
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID!, name: "habit 1", currentProgress: 0, goal: 10, type: HabitType.walking, date: "1-1-1111")
        try DatabaseHabitInserter.habitInserter.insertHabit(accountID: accountID!, name: "habit 2", currentProgress: 0, goal: 10, type: HabitType.sleeping, date: "1-2-1111")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        DatabaseAccountDeleter.accountDeleter.deleteAccountByName(username: "testAccount_.")
    }

    func testCalcualteSteps_return0_noProgressInWalkingHabits() throws {
        let analyzer = DataAnalyzer()
        let expectedResult = 0
        
        let calcualtedResult = analyzer.calculateSteps()
        
        XCTAssertEqual(calcualtedResult, expectedResult)
    }
    
    func testCalcualteSteps_return5000_5ProgressInWalkingHabits() throws {
        let analyzer = DataAnalyzer()
        let expectedResult = 5000
        let accountID = UserDefaults.standard.integer(forKey: "currentAccountID")
        
        try DatabaseHabitUpdater.habitUpdater.updateAccountHabitProgress(accountID: accountID, habitName: "habit 1", newProgress: 5)
        
        let calcualtedResult = analyzer.calculateSteps()
        
        XCTAssertEqual(calcualtedResult, expectedResult)
        
        addTeardownBlock {
            try DatabaseHabitUpdater.habitUpdater.updateAccountHabitProgress(accountID: accountID, habitName: "habit 1", newProgress: 0)
        }
    }
    
    
    func testCalcualteSleepPercentage_return50_4ProgressInSleephabit() throws {
        let analyzer = DataAnalyzer()
        let expectedResult = 50
        let accountID = UserDefaults.standard.integer(forKey: "currentAccountID")
        
        try DatabaseHabitUpdater.habitUpdater.updateAccountHabitProgress(accountID: accountID, habitName: "habit 2", newProgress: 4)
        
        let calculatedPercentage = analyzer.calcualteSleepPercentage()

        XCTAssertEqual(calculatedPercentage, expectedResult)
        
        addTeardownBlock {
            try DatabaseHabitUpdater.habitUpdater.updateAccountHabitProgress(accountID: accountID, habitName: "habit 2", newProgress: 0)
        }
        
    }
    
    func testCalculateSleep_return4_4ProgressInSleepHabit() throws {
        let analyzer = DataAnalyzer()
        let expectedResult = 4
        let accountID = UserDefaults.standard.integer(forKey: "currentAccountID")
        
        try DatabaseHabitUpdater.habitUpdater.updateAccountHabitProgress(accountID: accountID, habitName: "habit 2", newProgress: 4)
        
        let calcualtedSleep = analyzer.calculateSleep()
        
        XCTAssertEqual(calcualtedSleep, expectedResult)
        
        addTeardownBlock {
            try DatabaseHabitUpdater.habitUpdater.updateAccountHabitProgress(accountID: accountID, habitName: "habit 2", newProgress: 0)
        }
    }
    
    func testCalcualteDailyCOmpletion_return25_5ProgressInOneHabit() throws {
        let analyzer = DataAnalyzer()
        let expectedResult = 25
        let accountID = UserDefaults.standard.integer(forKey: "currentAccountID")
        
        try DatabaseHabitUpdater.habitUpdater.updateAccountHabitProgress(accountID: accountID, habitName: "habit 1", newProgress: 5)
        
        let completion = analyzer.calculateDailyCompletion()
        
        XCTAssertEqual(completion, expectedResult)
        
        addTeardownBlock {
            try DatabaseHabitUpdater.habitUpdater.updateAccountHabitProgress(accountID: accountID, habitName: "habit 1", newProgress: 0)
        }
    }
    
    //TODO: the bargraph data generator test

}
