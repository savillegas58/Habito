//
//  DatabaseFileInserter.swift
//  Habito
//
//  Created by admin on 2/12/25.
//

import Foundation
import SQLite3

class DatabaseChallengeInserter {
    static var challengeInserter = DatabaseChallengeInserter()
    
    func insertChallengeIntoAccount(accountID: Int, name: String, currentProgress: Int, goal: Int, date: String) throws {
        let db = DatabaseFoundation.databaseFoundation.db
        let insertionQuery = "INSERT INTO challenge(acccountID, name, currentProgress, goal, date) VALUES (?,?,?,?,?)"
        var insertionStatement : OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertionQuery, -1, &insertionStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertionStatement, 1, Int32(accountID))
            sqlite3_bind_text(insertionStatement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertionStatement, 3, Int32(currentProgress))
            sqlite3_bind_int(insertionStatement, 4, Int32(goal))
            sqlite3_bind_text(insertionStatement, 5, (date as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertionStatement) == SQLITE_DONE {
                print("challenge insserted succssfully")
            } else {
                throw DatabaseErrors.InsertionError("Error Inserting challenge")
            }
        } else {
            throw DatabaseErrors.InsertionError("Error Inserting challenge: statement failed to prepare")
        }
        sqlite3_finalize(insertionStatement)
    }
}
