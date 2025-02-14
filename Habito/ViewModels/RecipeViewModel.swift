//
//  RecipeViewModel.swift
//  Habito
//
//  Created by admin on 2/14/25.
//

import Foundation

class RecipeViewModel {
    func getAllRecipies() -> [Recipe]{
        var recipeList = [Recipe]()
        
        do {
            recipeList = try DatabaseRecipeFetcher.recipeFetcher.fetchAllRecipes()
        } catch {
            print("Failed to retrieve recipes in RecipeView Modle")
        }
        return recipeList
    }
}
