//
//  DataAnalysisViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class DataAnalyzer {
    //will this update?
    let currentAccountID = UserDefaults.standard.integer(forKey: "currentAccountID")
    let walkingHabitList : [Habit]
    let sleepingHabitList : [Habit]
    
    init() {
        var fetchedWalkingHabits = [Habit]()
        var fetchedSleepingHabits = [Habit]()
        
        do {
            fetchedWalkingHabits = try DatabaseHabitFetcher.habitFetcher.fetchWalkingHabits(accountID: currentAccountID)
            fetchedSleepingHabits = try DatabaseHabitFetcher.habitFetcher.fetchSleepingHabits(accountID: currentAccountID)
        } catch {
            print("Error fetching habits for Data Analyzer: \(error)")
        }
        self.walkingHabitList = fetchedWalkingHabits
        self.sleepingHabitList = fetchedSleepingHabits
    }
    
    //this currently wokrs under the assumption that 1 'point' of progress is 1000 steps
    //retunrs tha into to display in the Data Analyisis View
    func calculateSteps() -> Int {
        var totalSteps = 0
        
        for habit in walkingHabitList {
            totalSteps += habit.currentProgress!
        }
        return totalSteps
    }
    
    func calculateSleep() -> Int{
        var totalSleepHours = 0
        
        for habit in sleepingHabitList {
            totalSleepHours += habit.currentProgress!
        }
        
        return totalSleepHours
    }
}
