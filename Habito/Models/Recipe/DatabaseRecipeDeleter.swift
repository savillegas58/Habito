//
//  DatabaseRecipeDeleter.swift
//  Habito
//
//  Created by admin on 2/11/25.
//

import Foundation
import SQLite3

class DatabaseRecipeDeleter {
    static var recipeDeleter = DatabaseRecipeDeleter()
    
    func deleteAllRecipies() throws {
        var deleteStatement : OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        let deleteQuery = "DELETE FROM recipe"
        
        if sqlite3_prepare(db, deleteQuery, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("All recipes deleted.")
            } else {
                throw DatabaseErrors.DeletionError("Error deleting all accounts.")
            }
        }
        
        sqlite3_finalize(deleteStatement)
    }
}
