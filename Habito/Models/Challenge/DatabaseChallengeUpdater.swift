//
//  DatabaseChallengeUpdater.swift
//  Habito
//
//  Created by admin on 2/12/25.
//

import Foundation
import SQLite3

class DatabaseChallengeUpdater {
    static var challengeUpdater = DatabaseChallengeUpdater()
    
    private init(){}
    
    func updateAccountChallengeProgress(accountID: Int, challengeName: String, newProgress: Int) throws {
        let updateQuery = "UPDATE challenge SET currentProgress = '\(newProgress)' WHERE accountID = '\(accountID)' AND name = '\(challengeName)'"
        let db = DatabaseFoundation.databaseFoundation.db
        var updateStatement : OpaquePointer?
        
        if sqlite3_prepare_v2(db, updateQuery, -1, &updateStatement, nil) == SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Account habit updated")
            } else {
                throw DatabaseErrors.UpdateError("Error updating challenge progress")
            }
        }
    }
}
