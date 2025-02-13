//
//  InitialViewModel.swift
//  Habito
//
//  Created by admin on 2/12/25.
//

import Foundation

///This is a kind of sloppy way to initialize the database when the app starts
class InitialViewModel {
    init(){
        do {
            try DatabaseFoundation.databaseFoundation.createDatabase()
        } catch {
            print("Databasse failed to initialize: '\(error)'")
            return
        }
        populateRecipies()
        print("Database Initialized successfuly")
    }
    
    //recipies aren't user specific right now and are initialized here
    //this may need to change
    //TODO: the rest of the recipies
    private func populateRecipies() {
        do {
            try DatabaseRecipeDeleter.recipeDeleter.deleteAllRecipies()
            try DatabaseRecipeInserter.recipeInserter.insertRecipe(name: "Rice with fresh vegetables", ingredients: "1 cup of cooked brown rice\nCucumber slices\nCherry tomatoes\nBell peppers (sliced)\nChopped Pasrsely\nOlive Oil\nLemon Juice\nSale and Pepper to taste", instructions: "1. In a serving bowl, place the cooked brown rice as the base\n2. Add cucumber slices, cherry tomatoes, and bell pepper slices ont top\n3. Sprinkle chopped paresly over the salad\n4. For the dressing: Mix olive oil, lemon juice, and a picn h of salt and pepper\n5. Drizzle the dressing over the salad and serve immediately", suggestions: "You can customize it with additional toppings or ingredients to suit your taste or calorie count!", timeInMinutes: 30, calories: 300, rating: 4)
            print("Defautl recipies added")
        } catch {
            print("Default recipies failed to initialize")
        }
        
    }
}
