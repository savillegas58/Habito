//
//  DatabseAccountFetcherTest.swift
//  HabitoTests
//
//  Created by admin on 2/10/25.
//

import XCTest
@testable import Habito

final class DatabseAccountFetcherTest: XCTestCase {

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
            try DatabaseInserter.databaseInserter.insertAccount(username: accountSpecificData, password: accountSpecificData, phoneNumber: accountSpecificData, email: accountSpecificData)
        }
    }

    func testFetchAllAccounts_noThrows_noAccountsInDatabase() throws {
        XCTAssertNoThrow(try DatabaseAccountFetcher.accountFetcher.fetchAllAccounts())
    }
    
    func testFetchAllAccounts_returns_empty_array_noAccountsInDataBase() throws {
        XCTAssertEqual(try DatabaseAccountFetcher.accountFetcher.fetchAllAccounts().count, 0)
    }
    
    func testFetchAllAccounts_returnsArrayWith2Accountsa_2AccountsInDatabase() throws {
        try populateDataBaseWithAccounts(numberOfAccounts: 2)
        let fetchResult = try DatabaseAccountFetcher.accountFetcher.fetchAllAccounts()
        XCTAssertEqual(fetchResult.count, 2)
    }
}
