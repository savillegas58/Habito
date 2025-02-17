//
//  HabitViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class HabitViewModel {
    static var habitFetcher = HabitViewModel()
    var progressPercentage = 0 
    
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
    
    private func calcProgress(habit: Habit) -> Int {
        let progress : Double = Double(habit.currentProgress!)
        let goal : Double = Double(habit.goal!)
        let percentageAsDecimal = progress/goal
        let percentageAsInt = Int(percentageAsDecimal * 100)
        return percentageAsInt
    }
    
    //temporrary method, hopefully
    func getAnySingleHabit() -> Habit {
        let list = getCurrentAccountHabits()
        let habit = list.first!
        progressPercentage = calcProgress(habit: habit)
        
        return habit
    }
    
}
