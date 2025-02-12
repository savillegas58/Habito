//
//  DatabaseRecipeFetcher.swift
//  Habito
//
//  Created by admin on 2/11/25.
//

import Foundation
import SQLite3

class DatabaseRecipeFetcher {
    static var recipeFetcher = DatabaseRecipeFetcher()
    var recipeList = [Recipe]()
    
    func fetchAllRecipes() throws -> [Recipe] {
        recipeList.removeAll()
        
        var recipeStatement : OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        let recipeQuery = "SELECT * FROM recipe"
        
        if sqlite3_prepare_v2(db, recipeQuery, -1, &recipeStatement, nil) != SQLITE_OK {
            throw DatabaseErrors.FetchingError("Error fetching all recipes from the database")
        }
        
        while(sqlite3_step(recipeStatement) == SQLITE_ROW) {
            let name = String(cString: sqlite3_column_text(recipeStatement, 0))
            let ingredients = String(cString: sqlite3_column_text(recipeStatement, 1))
            let instructions = String(cString: sqlite3_column_text(recipeStatement, 2))
            let suggestions = String(cString: sqlite3_column_text(recipeStatement, 3))
            let timeInMinute = Int(sqlite3_column_int(recipeStatement, 4))
            let calories = Int(sqlite3_column_int(recipeStatement, 5))
            let ratings = Int(sqlite3_column_int(recipeStatement, 6))
            
            
            let fetchedRecipe = Recipe(name: name, ingredients: ingredients, instruction: instructions, suggestions: suggestions, timeInMinutes: timeInMinute, calories: calories, rating: ratings)
            recipeList.append(fetchedRecipe)
        }
        
        return recipeList
    }
}
