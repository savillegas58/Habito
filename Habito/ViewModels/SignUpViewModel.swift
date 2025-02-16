//
//  SignUpViewModel.swift
//  Habito
//
//  Created by admin on 2/6/25.
//

import Foundation

class SignUpViewModel {
    private var createdAccountID : Int?
    
    func createAccount(username: String, email: String, phoneNumber: String, password: String) {
        do {
            try DatabaseAccountInserter.accountInserter.insertAccount(username: username, password: password, phoneNumber: phoneNumber, email: email)
            let createdAccount = DatabaseAccountFetcher.accountFetcher.fetchAccountByUsername(username: username)
            createdAccountID = createdAccount?.ID
        } catch {
            print("Encountered database error when attempting to create acount: \(error)")
            return
        }
        populateDefaultHabits()
        populateDefaultChallenges()
        print("Account successfully added.")
        //persisting the accontID here will be unessesary if we transition from sing up to the log in screen, but otherwise it will need to be done
        persistAccountID()
    }
    
    private func persistAccountID() {
        UserDefaults.standard.set(createdAccountID, forKey: "currentAccountID")
    }
    
    //this is is just placeholder data for now
    private func populateDefaultHabits() {
        do {
            try DatabaseHabitInserter.habitInserter.insertHabit(accountID: createdAccountID!, name: "Drinking", currentProgress: 0, goal: 8, type: HabitType.drinking)
            try DatabaseHabitInserter.habitInserter.insertHabit(accountID: createdAccountID!, name: "Walking", currentProgress: 0, goal: 10, type: HabitType.walking)
            try DatabaseHabitInserter.habitInserter.insertHabit(accountID: createdAccountID!, name: "Sleep", currentProgress: 0, goal: 8, type: HabitType.sleeping)
            try DatabaseHabitInserter.habitInserter.insertHabit(accountID: createdAccountID!, name: "Exercise", currentProgress: 0, goal: 20, type: HabitType.exercising)
        } catch {
            print("Encountered database error when attemping to add default habits to new account: \(error)")
            return
        }
    }
    
    //this is just placehodler data for now
    private func populateDefaultChallenges() {
        do {
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 1", currentProgress: 0, goal: 10, date: "1")
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 2", currentProgress: 0, goal: 10, date: "2")
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 3", currentProgress: 0, goal: 10, date: "3")
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 4", currentProgress: 0, goal: 10, date: "4")
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 5", currentProgress: 0, goal: 10, date: "5")
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 6", currentProgress: 0, goal: 10, date: "6")
            try DatabaseChallengeInserter.challengeInserter.insertChallengeIntoAccount(accountID: createdAccountID!, name: "challenge 7", currentProgress: 0, goal: 10, date: "7")
            //TODO: minimum of 15
        } catch {
            print("Encountered database error when attempting to add default habits to new account: \(error)")
        }
    }
}
