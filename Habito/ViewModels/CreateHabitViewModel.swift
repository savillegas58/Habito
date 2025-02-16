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
            try DatabaseHabitInserter.habitInserter.insertHabit(accountID: currentAccountID, name: name, currentProgress: 0, goal: goal, type: HabitType.drinking)
        } catch {
            print("Error inserting new habit in CreatehabitViewController")
        }
    }
}
