//
//  SignInTest.swift
//  HabitoTests
//
//  Created by admin on 2/18/25.
//

import XCTest
@testable import Habito

final class SignInTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseAccountInserter.accountInserter.insertAccount(username: "SignInTestAccount_.", password: "password", phoneNumber: "", email: "")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        DatabaseAccountDeleter.accountDeleter.deleteAccountByName(username: "SignInTestAccount_.")
    }

    func testProvidedCredentailAreValid_returnsFalse_usernameDoesntMatch() throws {
        let username = "no match"
        let password = "password"
        
        XCTAssertFalse(SignInViewModel.signInViewModel.providedCredentialAreValid(username: username, password: password))
    }
    
    func testProvidedCredentailsAreValid_returnsFalse_passwrordDeosntMatch() {
        let username = "SignInTestAccount_."
        let password = "no match"
        
        XCTAssert(SignInViewModel.signInViewModel.providedCredentialAreValid(username: username , password: password))
    }
    
    func testProvidedCredentailsAreValid_returnTrue_credentailsAreValid() {
        let username = "SignInTestAccount_."
        let password = "password"
        
        XCTAssertTrue(SignInViewModel.signInViewModel.providedCredentialAreValid(username: username, password: password))
    }

}
