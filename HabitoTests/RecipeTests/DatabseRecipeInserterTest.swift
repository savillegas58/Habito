//
//  DatabseRecipeInserterTest.swift
//  HabitoTests
//
//  Created by admin on 2/11/25.
//

import XCTest
@testable import Habito
import SQLite3

final class DatabseRecipeInserterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        /*let delete = "DROP TABLE IF EXISTS recipe"
        
        var deleteStatement : OpaquePointer?
        let db = DatabaseFoundation.databaseFoundation.db
        
        if sqlite3_prepare(db, delete, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Table delted")
            } else {
                throw DatabaseErrors.DeletionError("Error deleting all accounts.")
            }
        }*/
        
        try DatabaseFoundation.databaseFoundation.createDatabase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }

    func testRecipeInserter_noThrows_noRecipesInDatabase() throws {
        XCTAssertNoThrow(try DatabaseRecipeInserter.recipeInserter.insertRecipe(name: "test", ingredients: "test", instructions: "test", suggestions: "test", timeInMinutes: 1, calories: 1, rating: 1))
    }
}
