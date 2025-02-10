//
//  DatabseEditorTest.swift
//  HabitoTests
//
//  Created by admin on 2/10/25.
//

import XCTest
@testable import Habito

final class DatabaseEditorTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseFoundation.databaseFoundation.createDatabase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAccountInsertion_noThrow_noExistingAccounts() throws {
        XCTAssertNoThrow(try DatabaseEditor.databaseEditor.insertAccount(username: "testUsername", password: "testPassword", phoneNumber: "testPhoneNumber", email: "testEmail"))
    }

    /*func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }*/

}
