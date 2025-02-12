//
//  DatabseRecipeDeleterTest.swift
//  HabitoTests
//
//  Created by admin on 2/11/25.
//

import XCTest
@testable import Habito

final class DatabseRecipeFetcherTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try DatabaseFoundation.databaseFoundation.createDatabase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchAllRecipies_noThrows_noRecipiesInDatabase() throws {
        XCTAssertNoThrow(try DatabaseRecipeFetcher.recipeFetcher.fetchAllRecipes())
    }
}
