//
//  DatabaseAccountDeleter.swift
//  Habito
//
//  Created by admin on 2/10/25.
//

import Foundation
import SQLite3

class DatabaseAccountDeleter {
    static var accountDeleter = DatabaseAccountDeleter()
    
    
    private init(){}
    
    ///deleteAllAccounts
    ///no arguments
    ///no return
    ///throws DatabaseErros.DeletionError
    ///This funcion will delete all accounts from the account table. This mthod primarily exists for testing purposes and should likely never be used oustside testing
    func deleteAllAccounts() throws {
        var deleteStatment : OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        let deleteQuery = "DELETE FROM account"
        
        if sqlite3_prepare(db, deleteQuery, -1, &deleteStatment, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatment) == SQLITE_DONE {
                print("All accounts deleted.")
            } else {
                throw DatabaseErrors.DeletionError("Error deleting all accounts.")
            }
        }
        
        sqlite3_finalize(deleteStatment)
    }
    
    ///deleteAccountByName(username:)
    ///
    func deleteAccountByName(username: String) {
        var deleteStatement : OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        let deleteQuery = "DELETE FROM account WHERE username = '\(username)'"
        
        if sqlite3_prepare(db, deleteQuery, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                
            }
        }
        sqlite3_finalize(deleteStatement)
    }
}
