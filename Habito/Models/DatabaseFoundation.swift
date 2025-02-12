//
//  DatabaseFoundation.swift
//  Habito
//
//  Created by Joshua Hatch on 2/6/25.
//

import Foundation
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
        try createHabitTable()
        try createChallengeTable()
        try createRecipeTable()
    }
    
    ///createAccountTable()
    ///No arguments
    ///No return
    ///throws: TableCreationError
    ///Creates a table for storing user accounts with id, username, password, phoneNumber, email, and profilePicutre columns.
    ///id is the primary key and is autoincremented
    private func createAccountTable() throws {
        let accountTableCreationStatement = "CREATE TABLE IF NOT EXISTS account(accountID INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE, password TEXT, phoneNumber TEXT, email TEXT, profilePictureLink TEXT)"
        
        if sqlite3_exec(db, accountTableCreationStatement, nil, nil, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            throw DatabaseErrors.TableCreationError("Error creating account table in database: " + errorMessage)
        }
    }
    
    ///createHabitTable()
    ///No arguments
    ///no return
    ///throws: tableCreationError
    ///Creates a table for storing habits with name, curentProgressm and goal columns and a foreign key referencing the accountID of an account
    ///columns curentProgress and goal may be subject to change once we knwo what we need for the habits
    private func createHabitTable() throws {
        let habitTableCreationStatement = "CREATE TABLE IF NOT EXISTS habit(accountID INTEGER, name TEXT, currentProgress INTEGER, goal INTEGER, FOREIGN KEY(accountID) REFERENCES account(accountID) ON DELETE CASCADE)"
        
        if sqlite3_exec(db, habitTableCreationStatement, nil, nil, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            throw DatabaseErrors.TableCreationError("Error creating habit table in database: " + errorMessage)
        }
    }
    
    ///createChallengeTable()
    ///no arguments
    ///no return
    ///throws: table Creation error
    ///Creates a table for storing challenges with name, curentProgress, goal, and date columns and a foreign key referencing the accountID of an account
    ///Date is stores as Text becaus SQLite doesnt not have a dedicate date type
    private func createChallengeTable() throws {
        let challengeTableCreationStatement = "CREATE TABLE IF NOT EXISTS challenge(accountID INTEGER, name TEXT, currentProgress INTEGER, goal INTEGER, date TEXT, FOREIGN KEY(accountID) REFERENCES account(accountID) ON DELETE CASCADE)"
        
        if sqlite3_exec(db, challengeTableCreationStatement, nil, nil, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            throw DatabaseErrors.TableCreationError("Error creating challenge habit table in database: " + errorMessage)
        }
    }
    
    ///createRecipeTable()
    ///no argument
    ///no return
    ///throws: tabelCreationError
    ///creates a table for stroing recipes with the columns anme, ingridients, suggestions, timeInMinutes, calories, and rating
    ///recipes are not assocaited with accounts
    //TODO: rename suggesstions to instructions
    private func createRecipeTable() throws {
        let recipeTableCreationStatment = "CREATE TABLE IF NOT EXISTS recipe(name TEXT, ingredients TEXT, instructions TEXT, suggestions TEXT, timeInMinutes INTEGER, calories INTEGER, rating INTEGER)"
        
        if sqlite3_exec(db, recipeTableCreationStatment, nil, nil, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            throw DatabaseErrors.TableCreationError("Error creating recipe table in database: " + errorMessage)
        }
    }
    
}
