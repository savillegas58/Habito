//
//  DatabaseFoundation.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation
import SQLite3

class DatabaseFoundation {
    static var databaseFoundation = DatabaseFoundation()
    var db: OpaquePointer?
    
    func createDatabase() throws {
        let dbPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("HabitoDatabase.sqlite").path()
        
        if sqlite3_open(dbPath, &db) != SQLITE_OK {
            throw DatabaseErrors.DatabaseCreationError("Error creating database with path: " + dbPath)
        }
    }
}
