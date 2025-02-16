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
    
    init() {
        var fetchedWalkingHabits = [Habit]()
        
        do {
            fetchedWalkingHabits = try DatabaseHabitFetcher.habitFetcher.fetchWalkingHabits(accountID: currentAccountID)
        } catch {
            print("Error fetching habits for Data Analyzer: \(error)")
        }
        self.walkingHabitList = fetchedWalkingHabits
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
}
