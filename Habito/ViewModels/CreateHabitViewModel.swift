//
//  CreateHabitViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class CreateHabitViewModel {
    func addHabitToCurrentAccount(name: String, type: String) {
        let currentAccountID = UserDefaults.standard.integer(forKey: "currentAccountID")
        
        do {
                //TODO: DATE IS a TEMPORRAY PLACEHOLDER
                //TODO better handling for empty inputs?
            if name.isEmpty || type.isEmpty {
                print("empty inputs")
                return
            }
            
            let habitType = getTypeFromString(stringType: type)
            try DatabaseHabitInserter.habitInserter.insertHabit(accountID: currentAccountID, name: name, currentProgress: 0, goal: 10, type: habitType, date: "2-17-2025")
        } catch {
            print("Error inserting new habit in CreatehabitViewModel: \(error)")
        }
    }
    
    private func getTypeFromString(stringType: String) -> HabitType {
        if stringType == "Drinking" {
            return HabitType.drinking
        } else if stringType == "Walking" {
            return HabitType.walking
        } else if stringType == "Sleeping" {
            return HabitType.sleeping
        } else {
            return HabitType.exercising
        }
    }
}
