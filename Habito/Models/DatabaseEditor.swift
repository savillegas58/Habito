//
//  DatabaseAccessor.swift
//  Habito
//
//  Created by admin on 2/10/25.
//

import Foundation
import SQLite3

class DatabaseEditor {
    static var databaseEditor = DatabaseEditor()
    
    //ID doesn't need to be specified and profile picture link isn't specified here
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
            sqlite3_bind_text(insertStatement, 5, "", -1, nil)
            
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
