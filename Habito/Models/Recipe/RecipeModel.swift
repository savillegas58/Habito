//
//  RecipeModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class  Recipe {
    var name : String?
    var ingredeients : String?
    var suggestions : String?
    var timeInMinutes : Int?
    var calories : Int?
    var rating : Int? //this might be better as a float?
    
    init(name: String, ingredients: String, suggestions: String, timeInMinutes: Int, calories : Int, rating : Int) {
        self.name = name
        self.ingredeients = ingredients
        self.suggestions = suggestions
        self.timeInMinutes = timeInMinutes
        self.calories = calories
        self.rating = rating
    }
}
