//
//  HabitViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class HabitViewModel {
    static var habitFetcher = HabitViewModel()
    
    private init(){}
    
    func getCurrentAccountHabits() -> [Habit] {
        let currentAccountID = UserDefaults.standard.integer(forKey: "currentAccountID");
        var currentAccountHabits = [Habit]()
        
        do {
            currentAccountHabits = try DatabaseHabitFetcher.habitFetcher.fetchAccountHabits(accountID: currentAccountID)
        } catch {
            print("Error fetching account habits in HabitViewModel.")
        }
        return currentAccountHabits
    }
    
}
