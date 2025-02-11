//
//  DatabaseAccessor.swift
//  Habito
//
//  Created by admin on 2/10/25.
//

import Foundation
import SQLite3

class DatabaseAccountInserter {
    static var accountInserter = DatabaseAccountInserter()
    

    ///insertAccount(username: passsword: phoneNumber: email)
    ///arguments username, password, phonenumber, and email. All are of type NSString.
    ///no return
    ///throws DatabasseErrors.InsertionError
    ///Used to insert a  new account into the database with the specified data. The user's ID is determiend after the user is inserted and
    ///the profile picutre link is meant to be set to a default image when the account is first added.
    //TODO: defautl user image
    func insertAccount(username: NSString, password: NSString, phoneNumber: NSString, email: NSString) throws {
        var insertStatement: OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        let insertStatemntQuery = "INSERT INTO account(username, password, phoneNumber, email, profilePictureLink) VALUES(?,?,?,?,?);"
        
        if sqlite3_prepare_v2(db, insertStatemntQuery, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, username.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, password.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, phoneNumber.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, email.utf8String, -1, nil)
            
            //this is for the profile picture and can be change once we have actually pictures to use
            sqlite3_bind_text(insertStatement, 5, " ", -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Account successfully inserted")
            } else {
                throw DatabaseErrors.InsertionError("Failed to insert account.")
            }
        } else {
            throw DatabaseErrors.InsertionError("Failed to insert account: statement failed to prepare.")
        }
        
        sqlite3_finalize(insertStatement)
    }
}
