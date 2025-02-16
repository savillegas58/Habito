//
//  HabitModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class Habit: Identifiable {
    var accountID : Int? //foregin key to owner account
    var name : String?
    var currentProgress : Int?
    var goal : Int?
    var type : HabitType?
    
    init(accountID : Int, name: String, currentProgress: Int, goal: Int, type: HabitType) {
        self.accountID = accountID
        self.name = name
        self.currentProgress = currentProgress
        self.goal = goal
        self.type = type
    }
}
