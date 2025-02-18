//
//  CreateHabitTest.swift
//  HabitoTests
//
//  Created by admin on 2/18/25.
//

import XCTest
@testable import Habito

final class CreateHabitTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseAccountInserter.accountInserter.insertAccount(username: "testAccount_.", password: "", phoneNumber: "", email: "")
        let account = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "testAccount_.")
        let id = account?.ID
        UserDefaults.standard.set(id, forKey: "currentAccountID")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        DatabaseAccountDeleter.accountDeleter.deleteAccountByName(username: "testAccount_.")
    }

    func testAddHabitToAccount_1HabitInAccount_accountWithNoHabits() throws {
        let expectedresult = 1
        let model = CreateHabitViewModel()
        model.addHabitToCurrentAccount(name: "Habit", type: "Drinking")
        
        let count = HabitViewModel.habitFetcher.getCurrentAccountHabits().count
        
        XCTAssertEqual(count, expectedresult)
    }

}
