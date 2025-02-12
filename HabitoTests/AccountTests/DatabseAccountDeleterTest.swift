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
        try DatabaseAccountDeleter.accountDeleter.deleteAllAccounts()
    }
    
    func populateDataBaseWithAccounts(numberOfAccounts: Int) throws {
        for i in 0..<numberOfAccounts {
            let accountSpecificData = ("test: " + String(i))
            try DatabaseAccountInserter.accountInserter.insertAccount(username: accountSpecificData, password: accountSpecificData, phoneNumber: accountSpecificData, email: accountSpecificData)
        }
    }
    
    func testDeleteAllAccounts_noThrows_NoAccountsInDatabase() throws {
        XCTAssertNoThrow(try DatabaseAccountDeleter.accountDeleter.deleteAllAccounts())
    }
    
    func testDeleteByUsername_removesSpecifiedAccount_accountToDeleteExistsInDatabase() throws {
        try populateDataBaseWithAccounts(numberOfAccounts: 3)
        
        let accountUsernameToDelete = "test: 2"
        DatabaseAccountDeleter.accountDeleter.deleteAccountByName(username: accountUsernameToDelete)
        
        XCTAssertNil(DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: accountUsernameToDelete))
        
    }

}
