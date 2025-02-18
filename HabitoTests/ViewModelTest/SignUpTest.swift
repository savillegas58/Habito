//
//  SignUpTest.swift
//  HabitoTests
//
//  Created by admin on 2/18/25.
//

import XCTest
@testable import Habito

final class SignUpTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //try DatabaseFoundation.databaseFoundation.createDatabase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPhonenumberIsntValid_returnTrue_PhonenumberIsInvalid() throws {
        let invalidPhone = "this is not a phone number"
        
        let model = SignUpViewModel()
        
        let isPhonenumberInvalid = model.phonenumberIsntValid(phoneNumber: invalidPhone)
        
        XCTAssertTrue(isPhonenumberInvalid)
    }
    
    func testPhoneIsntValid_returnsFalse_PhonenubmersAreValid() throws {
        let validPhone1 = "970-111-1111"
        let validPhone2 = "970 123 4556"
        
        let viewmodel = SignUpViewModel()
        
        XCTAssertFalse(viewmodel.phonenumberIsntValid(phoneNumber: validPhone1))
        XCTAssertFalse(viewmodel.phonenumberIsntValid(phoneNumber: validPhone2))
    }
    
    func testPhoneIsntValid_returnsTrue_PhonenumberIsCloseButNOtValid() {
        let invalidNumber = "979 123 45665"
        
        let viewmodel = SignUpViewModel()
        
        XCTAssertTrue(viewmodel.phonenumberIsntValid(phoneNumber: invalidNumber))
    }



}
