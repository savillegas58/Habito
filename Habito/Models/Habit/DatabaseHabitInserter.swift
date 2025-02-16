//
//  DatabaseHabitInserter.swift
//  Habito
//
//  Created by admin on 2/11/25.
//

import Foundation
import SQLite3

class DatabaseHabitInserter {
    static var habitInserter = DatabaseHabitInserter()
    
    private init(){}
    
    //TODO: ADD COMMENT ABOUT THE FOEEGIN KEY STUFF
    func insertHabit(accountID : Int, name : String, currentProgress : Int, goal : Int, type : HabitType, date : String) throws {
        var insertStatement : OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        let insertQuery = "INSERT INTO habit(accountID, name, currentProgress, goal, type, date) VALUES(?,?,?,?,?,?)"
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(accountID))
            sqlite3_bind_text(insertStatement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 3, Int32(currentProgress))
            sqlite3_bind_int(insertStatement, 4, Int32(goal))
            let typeAsString = type.rawValue
            sqlite3_bind_text(insertStatement, 5, (typeAsString as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, (date as NSString).utf8String, -1, nil)
            
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Habit Succssfuly inserted.")
            } else {
                throw DatabaseErrors.InsertionError("Error inserting habit")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            throw DatabaseErrors.InsertionError("Error inserting habit: couldn ot prepare statement: " + errorMessage)
        }
        sqlite3_finalize(insertStatement)
    }
}
