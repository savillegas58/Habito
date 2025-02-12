//
//  DatabaseChallengeDeleter.swift
//  Habito
//
//  Created by admin on 2/12/25.
//

import Foundation
import SQLite3

class DatabaseChallengeDeleter {
    static var challengeDeleter = DatabaseChallengeDeleter()
    
    func deleteAllChallengesFromAccount(accountID: Int) throws {
        let db = DatabaseFoundation.databaseFoundation.db
        let deleteQuery = "DELETE FROM challenge WHERE accountID = '\(accountID)'"
        var deleteStatement : OpaquePointer?
        
        if sqlite3_prepare_v2(db, deleteQuery, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Account's challenges deleted")
            } else {
                throw DatabaseErrors.DeletionError("Error Deleteing account's challenges")
            }
        }
        sqlite3_finalize(deleteStatement)
    }
    
    //TODO: DELETE INDIVIDUAL CHALLENGES
}
