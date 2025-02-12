//
//  DatabaseHabitDeleter.swift
//  Habito
//
//  Created by admin on 2/11/25.
//

import Foundation
import SQLite3

class DatabaseHabitDeleter {
    static var habitDeleter = DatabaseHabitDeleter()
    
    func deleteAllHabitsFromAccount(accountID: Int) throws {
        let db = DatabaseFoundation.databaseFoundation.db
        let deleteQuery = "DELETE FROM habit WHERE accountID = '\(accountID)'"
        var deleteStatement : OpaquePointer?
        
        if sqlite3_prepare_v2(db, deleteQuery, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE{
                print("Account's habits deleted")
            } else {
                throw DatabaseErrors.DeletionError("Error deleting account's habits")
            }
        }
        sqlite3_finalize(deleteStatement)
    }
    
    //TODO: DELETE INDIVIDUAL HABIT if nessesary
}
