//
//  DatabaseAccountUpdater.swift
//  Habito
//
//  Created by admin on 2/10/25.
//

import Foundation
import SQLite3

class DatabaseAccountUpdater {
    static var accountUpdater = DatabaseAccountUpdater()
    
    private init() {}
    
    ///updateAccountUsername(suername: newUsername:)
    ///arguments:
    ///returns nothing
    ///throws DatabseErros.UpdateError
    func updateAccountUsername(username: String, newUsername: String) throws {
        let updateQuery = "UPDATE account SET username = '\(newUsername)' WHERE username = '\(username)'"
        try executeUpdateQuery(updateQuery: updateQuery)
    }
    
    ///
    func updateAccountPassword(username: String, password: String) throws {
        let updateQuery = "UPDATE account SET password = '\(password)' WHERE username = '\(username)'"
        try executeUpdateQuery(updateQuery: updateQuery)
    }
    
    func updateAccountPhoneNumber(username : String, newPhonenumber: String) throws {
        let updateQuery = "UPDATE account SET phoneNumber = '\(newPhonenumber)' WHERE username = '\(username)'"
        try executeUpdateQuery(updateQuery: updateQuery)
    }
    
    func updateAccountEmail(username : String, newEmail : String) throws {
        let updateQuery = "UPDATE account SET email = '\(newEmail)' WHERE username = '\(username)'"
        try executeUpdateQuery(updateQuery: updateQuery)
    }
    
    func updateAccountProfilePictureLink(username : String, newProfilePictureLink : String) throws {
        let updateQuery = "UPDATE account SET profilePictureLink = '\(newProfilePictureLink)' WHERE username = '\(username)'"
        try executeUpdateQuery(updateQuery: updateQuery)
    }
    
    ///executeUpdateQuery(updateQuery:)
    ///arguments: updateQuery is a string passed by one of the calssses member methods and is the query that will be executed
    ///returns nothing
    ///throws DatabaseError.UpdateError
    ///The main workhorse of the class that will execute the update queries passed to it by the class's member methods.
    private func executeUpdateQuery(updateQuery: String) throws {
        var updateStatment : OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        
        if sqlite3_prepare_v2(db, updateQuery, -1, &updateStatment, nil) == SQLITE_OK {
            if sqlite3_step(updateStatment) == SQLITE_DONE {
                print("Row updated")
            } else {
                throw DatabaseErrors.UpdateError("Error Updating data.")
            }
            
        }
    }
}
