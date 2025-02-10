//
//  DatabseAccountDeleterTest.swift
//  HabitoTests
//
//  Created by admin on 2/10/25.
//

import XCTest
@testable import Habito

final class DatabseAccountDeleterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseFoundation.databaseFoundation.createDatabase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDeleteAllAccounts_noThrows_NoAccountsInDatabase() throws {
        XCTAssertNoThrow(try DatabaseAccountDeleter.accountDeleter.deleteAllAccounts())
    }

}
