//
//  ChallengeModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation


class Challenge {
    var accountID : Int? //foregin key to the owner account
    var name : String?
    var currentProgress : Int?
    var goal : Int?
    var date : String?
    
    init(accountID: Int, name: String, currentProgress: Int, goal: Int, date: String) {
        self.accountID = accountID
        self.name = name
        self.currentProgress = currentProgress
        self.goal = goal
        self.date = date
    }
}
