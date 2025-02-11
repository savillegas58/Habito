//
//  DatabaseHabitUpdater.swift
//  Habito
//
//  Created by admin on 2/11/25.
//

import Foundation
import SQLite3

class DatabaseHabitUpdater {
    static var habitUpdater = DatabaseHabitUpdater()
    
    //TODO: habit names are not enforced to be unique, should they be?
    ///
    func updateAccountHabitProgress(accountID: Int, habitName: String, newProgress: Int) throws {
        let updateQuery = "UPDATE habit SET currentProgress = '\(newProgress)' WHERE accountID = '\(accountID)' AND name = '\(habitName)'"
        let db = DatabaseFoundation.databaseFoundation.db
        var updateStatement : OpaquePointer?
        
        if sqlite3_prepare_v2(db, updateQuery, -1, &updateStatement, nil) == SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Account's habit updated")
            } else {
                throw DatabaseErrors.UpdateError("Error updating habit")
            }
        }
        
    }
}
