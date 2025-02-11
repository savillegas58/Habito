//
//  File.swift
//  Habito
//
//  Created by admin on 2/11/25.
//

import Foundation
import SQLite3

class DatabaseRecipeInserter {
    static var recipeInserter = DatabaseRecipeInserter()
    
    func insertRecipe(name: NSString, ingredients: NSString, suggestions: NSString, timeInMinutes: Int, calories: Int, rating: Int) throws {
        var insertStatement : OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        let insertQuery = "INSERT INTO recipe(name, ingredients, suggestions, timeInMinutes, calories, rating) VALUES(?,?,?,?,?,?)"
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, name.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, ingredients.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, suggestions.utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 4, Int32(timeInMinutes))
            sqlite3_bind_int(insertStatement, 5, Int32(calories))
            sqlite3_bind_int(insertStatement, 6, Int32(rating))
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Recipe successfully inserted")
            } else {
                throw DatabaseErrors.InsertionError("Error inserting recipe.")
            }
        } else {
            throw DatabaseErrors.InsertionError("Error inserting recipe: could not prepare statement")
        }
        
        sqlite3_finalize(insertStatement)
    }
}
