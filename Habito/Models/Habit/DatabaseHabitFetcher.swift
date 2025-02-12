//
//  DatabaseHabitFetcher.swift
//  Habito
//
//  Created by admin on 2/11/25.
//

import Foundation
import SQLite3

class DatabaseHabitFetcher {
    static var habitFetcher = DatabaseHabitFetcher()
    private var habitList = [Habit]()
    
    //TODO: FETCH INDIVIDUAL?
    
    func fetchAccountHabits(accountID: Int) throws -> [Habit] {
        habitList.removeAll()
        
        var habitStatement : OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        let habitQuery = "SELECT * FROM habit WHERE accountID = '\(accountID)'"
        
        if sqlite3_prepare_v2(db, habitQuery, -1, &habitStatement, nil) != SQLITE_OK{
            throw DatabaseErrors.FetchingError("Error fetching account's habits.")
        }
        
        while(sqlite3_step(habitStatement) == SQLITE_ROW) {
            let accountID = Int(sqlite3_column_int(habitStatement, 0))
            let name = String(cString: sqlite3_column_text(habitStatement, 1))
            let currentProgress = Int(sqlite3_column_int(habitStatement, 2))
            let goal = Int(sqlite3_column_int(habitStatement, 3))
            
            let fetchedHabit = Habit(accountID: accountID, name: name, currentProgress: currentProgress, goal: goal)
            habitList.append(fetchedHabit)
        }
        return habitList
    }
}
