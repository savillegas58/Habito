//
//  HabitViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class HabitViewModel {
    
    func getCurrentAccountHabits() -> [Habit] {
        let currentAccountID = UserDefaults.standard.integer(forKey: "currentAccountID");
        var currentAccountHabits = [Habit]()
        
        do {
            currentAccountHabits = try DatabaseHabitFetcher.habitFetcher.fetchAccountHabits(accountID: currentAccountID)
        } catch {
            print("Error fetching account habits in HabitViewModel.")
        }
        //testing
        print("fetch habits: " + String(currentAccountHabits.count))
        //
        return currentAccountHabits
    }
    
}
