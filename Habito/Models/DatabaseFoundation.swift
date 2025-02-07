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
    
    ///createDatabase()
    ///no arguments
    ///no return
    ///throws: DatabaseError
    ///Creates a  databse and populates the database with empty tables.
    //TODO: finish table creation
    func createDatabase() throws {
        let dbPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("HabitoDatabase.sqlite").path()
        
        if sqlite3_open(dbPath, &db) != SQLITE_OK {
            throw DatabaseErrors.DatabaseCreationError("Error creating database with path: " + dbPath)
        }
        try createTables()
    }
    
    ///createTables()
    ///no arguments
    ///no return
    ///Throws: DatabaseErrors (type is depedent on the which table creation method failed)
    ///creates tables for accounts, habits, +++ in the databse
    //TODO: finihs the rest of the table creation methods
    private func createTables() throws {
        try createAccountTable()
        //createHabitTable()
    }
    
    ///createAccountTable()
    ///No arguments
    ///No return
    ///throws: TableCreationError
    ///Creates a table for storing user accounts with id, username, password, phoneNumber, email, and profilePicutre columns.
    ///id is the primary key and is autoincremented
    private func createAccountTable() throws {
        let accountTableCreationStatement = "CREATE TABLE IF NOT EXISTS account(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT, phoneNumber TEXT, email TEXT, profilePictureLink TEXT)"
        
        if sqlite3_exec(db, accountTableCreationStatement, nil, nil, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            throw DatabaseErrors.TableCreationError("Error creating account table in database: " + errorMessage)
        }
    }
    
    //curentProgress and goal will likely be subject to change once we decide what we need for habits
    /*private func createHabitTable() {
        let habitTableCreationStatement = "CREATE TABLE IF NOT EXISTS habit(id INTEGER, name TEXT, currentProgress INTEGER, goal INTEGER)"
        //TODO: foerign key
    }*/
}
