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
    
    private init(){}
    
    func fetchAccountHabits(accountID: Int) throws -> [Habit] {
        habitList.removeAll()
    
        let habitQuery = "SELECT * FROM habit WHERE accountID = '\(accountID)'"
        try executeHabitFetch(habitQuery: habitQuery)

        return habitList
    }
    
    func fetchWalkingHabits(accountID: Int) throws -> [Habit] {
        habitList.removeAll()
        let habitQuery = "SELECT * FROM habit WHERE accountID = '\(accountID)' AND type = 'walking'"
        try executeHabitFetch(habitQuery: habitQuery)
        return habitList
    }
    
    func fetchSleepingHabits(accountID: Int) throws -> [Habit] {
        habitList.removeAll()
        let habitQuery = "SELECT * FROM habit WHERE accountID = '\(accountID)' AND type = 'sleeping'"
        try executeHabitFetch(habitQuery: habitQuery)
        return habitList
    }
    
    //OTHER 2 TYPES(?) AND FETCH BY DATE
    
    
    //I don't know if this funciton will actually serve any purpose in retrospect
    func fetchHabitsByDate(accountID: Int, date : String) throws -> [Habit] {
        habitList.removeAll()
        let habitQuery = "SELECT * FROM habit WHERE accountID = '\(accountID)' AND date = '\(date)'"
        try executeHabitFetch(habitQuery: habitQuery)
        return habitList
    }
    
    private func executeHabitFetch(habitQuery: String) throws {
        var habitStatement : OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        
        if sqlite3_prepare_v2(db, habitQuery, -1, &habitStatement, nil) != SQLITE_OK{
            throw DatabaseErrors.FetchingError("Error fetching account's habits.")
        }
        
        while(sqlite3_step(habitStatement) == SQLITE_ROW) {
            let accountID = Int(sqlite3_column_int(habitStatement, 0))
            let name = String(cString: sqlite3_column_text(habitStatement, 1))
            let currentProgress = Int(sqlite3_column_int(habitStatement, 2))
            let goal = Int(sqlite3_column_int(habitStatement, 3))
            let type = String(cString: sqlite3_column_text(habitStatement, 4))
            let typeAsEnum = HabitType(rawValue: type)
            let date = String(cString: sqlite3_column_text(habitStatement, 5))
            let fetchedHabit = Habit(accountID: accountID, name: name, currentProgress: currentProgress, goal: goal, type: typeAsEnum!, date: date)
            habitList.append(fetchedHabit)
        }
    }
}
