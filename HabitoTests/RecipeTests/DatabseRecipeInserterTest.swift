//
//  DatabseRecipeInserterTest.swift
//  HabitoTests
//
//  Created by admin on 2/11/25.
//

import XCTest
@testable import Habito

final class DatabseRecipeInserterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseFoundation.databaseFoundation.createDatabase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRecipeInserter_noThrows_noRecipesInDatabase() throws {
        XCTAssertNoThrow(try DatabaseRecipeInserter.recipeInserter.insertRecipe(name: "test", ingredients: "test", suggestions: "test", timeInMinutes: 1, calories: 1, rating: 1))
    }
}
