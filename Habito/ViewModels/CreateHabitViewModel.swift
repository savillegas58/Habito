//
//  CreateHabitViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class CreateHabitViewModel {
    func addHabitToCurrentAccount(name: String, goal: Int) {
        let currentAccountID = UserDefaults.standard.integer(forKey: "currentAccountID")
        
        do {
            try DatabaseHabitInserter.habitInserter.insertHabit(accountID: currentAccountID, name: name, currentProgress: 0, goal: goal)
        } catch {
            print("Error inserting new habit in CreatehabitViewController")
        }
    }
}
