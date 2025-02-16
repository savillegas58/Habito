//
//  DatabseAccountUpdaterTest.swift
//  HabitoTests
//
//  Created by admin on 2/10/25.
//

import XCTest
@testable import Habito

final class DatabseAccountUpdaterTest: XCTestCase {

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

    func testUpdateAccountUsername_updatedAccountFound_accoutNameUpdated() throws {
        let newUsername = "new name"
        try populateDataBaseWithAccounts(numberOfAccounts: 1)
        
        let oldFetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "test: 0")
        
        try DatabaseAccountUpdater.accountUpdater.updateAccountUsername(accountID: (oldFetchedAccount?.ID)!, newUsername: newUsername)
        
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: newUsername)
        
        XCTAssertNotNil(fetchedAccount)
    }
    
    func testUpdateAccountPassword_accountUpdated_accountPaswordUpdated() throws {
        let newPassword = "new pass"
        try populateDataBaseWithAccounts(numberOfAccounts: 1)
        
        let oldFetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "test: 0")
        try DatabaseAccountUpdater.accountUpdater.updateAccountPassword(accountID: (oldFetchedAccount?.ID)!, password: newPassword)
        
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "test: 0")
        
        XCTAssertEqual(fetchedAccount?.password, newPassword)
    }
    
    func testUpdateAccountPhoneNUmber_accountUpdated_accountPasswordUpadted() throws {
        let newPhoneNumber = "111-111-1111"
        try populateDataBaseWithAccounts(numberOfAccounts: 1)
        try DatabaseAccountUpdater.accountUpdater.updateAccountPhoneNumber(username: "test: 0", newPhonenumber: newPhoneNumber)
        
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "test: 0")
        
        XCTAssertEqual(fetchedAccount?.phoneNumber, newPhoneNumber)
    }
    
    func testUpdateAccountEmail_accountUpdated_accountEmailUpdated() throws {
        let newEmail = "new@new.com"
        try populateDataBaseWithAccounts(numberOfAccounts: 1)
        try DatabaseAccountUpdater.accountUpdater.updateAccountEmail(username: "test: 0", newEmail: newEmail)
        
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username:
        "test: 0")
        
        XCTAssertEqual(fetchedAccount?.email, newEmail)
    }
    
    func testUpdateAccountProfilePictureLink_accountUpdated_accountProfilePictureUpdated() throws {
        let newProfilePictureLink = "test.jpg"
        try populateDataBaseWithAccounts(numberOfAccounts: 1)
        try DatabaseAccountUpdater.accountUpdater.updateAccountProfilePictureLink(username: "test: 0", newProfilePictureLink: newProfilePictureLink)
        
        let fetchedAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: "test: 0")
        
        XCTAssertEqual(fetchedAccount?.profilePictureLink, newProfilePictureLink)
    }
}
