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
}
