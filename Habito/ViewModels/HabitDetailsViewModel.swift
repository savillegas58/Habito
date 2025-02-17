//
//  HabitDetailsViewModel.swift
//  Habito
//
//  Created by admin on 2/16/25.
//

import Foundation

class HabitDetailsViewModel{
    static var habitUpdater = HabitDetailsViewModel()
    
    let currentAccountID = UserDefaults.standard.integer(forKey: "currentAccountID")
    
    private init() {}
    
    func updateHabitProgress(habitName: String, newProgress: Int){
        
        do {
            try DatabaseHabitUpdater.habitUpdater.updateAccountHabitProgress(accountID: currentAccountID, habitName: habitName, newProgress: newProgress)
        } catch {
            print("Error updating habit in HabitDetialViewModel: \(error)")
        }
    }
}
