//
//  CreateHabitViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class CreateHabitViewModel {
    //TODO: ACCOUNT FOR TYPE!
    func addHabitToCurrentAccount(name: String, goal: Int) {
        let currentAccountID = UserDefaults.standard.integer(forKey: "currentAccountID")
        
        do {
                //TODO: type needs to be sourced from the view, this defauilt is temporay!
                //TODO: DATE ISS ALSO TEMPORRAY
            try DatabaseHabitInserter.habitInserter.insertHabit(accountID: currentAccountID, name: name, currentProgress: 0, goal: goal, type: HabitType.drinking, date: "2-17-2025")
        } catch {
            print("Error inserting new habit in CreatehabitViewController")
        }
    }
}
