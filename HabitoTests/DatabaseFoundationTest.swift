//
//  DatabaseFoundationTest.swift
//  HabitoTests
//
//  Created by admin on 2/7/25.
//

import XCTest
@testable import Habito

final class DatabaseFoundationTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDatabaseCreation_noThrow_noExistingDatabasse() {
        XCTAssertNoThrow(try DatabaseFoundation.databaseFoundation.createDatabase())
    }

    func testDatabaseCreation_noThrowandDataisntOverwritten_existingDatabase() throws {
        try DatabaseFoundation.databaseFoundation.createDatabase()
        
        try DatabaseAccountInserter.accountInserter.insertAccount(username: "c", password: "c", phoneNumber: "c", email: "c")
        
        XCTAssertNoThrow(try DatabaseFoundation.databaseFoundation.createDatabase())
        
        let fetchedAccounts = try DatabaseAccountFetcher.accountFetcher.fetchAllAccounts()
        
        XCTAssertEqual(fetchedAccounts.count, 1)
    }

}
